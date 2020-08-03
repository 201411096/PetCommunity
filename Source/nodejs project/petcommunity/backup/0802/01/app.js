const https = require('https');
const fs = require('fs');
const options = {
  pfx: fs.readFileSync('petcommunity.pfx'),
  passphrase: '123456'
};

var app = https.createServer(options, (req, res) => {
    res.setHeader("Access-Control-Allow-Origin", "*");
    res.setHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS");
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type,Origin,Accept,Access-Control-Request-Method,Access-Control-Request-Headers,Authorization');
    res.setHeader('Access-Control-Allow-Credentials', true);

//}).listen(3000, '192.168.0.18', () => {
}).listen(3000, '121.171.119.57', () => {
    console.log('listening on *:3000');
});

var io = require('socket.io')(app);

io.on('connection', function(socket){
  console.log('user connected');
  socket.on('disconnect', function(){
    console.log('user disconnected');
  });
  socket.on('joinRoom', function(roomInfo){
    if(roomInfo.memberId!="tempMember"){ // 회원일 경우 socket의 nickname 지정
      // console.log('memberInfo check ... ' + roomInfo.memberId);
      socket.nickname = roomInfo.memberId;
      console.log('check socket_nickname in joinRoomEvent_01 ...' + socket.nickname);
    }
    else{ // 비회원일 경우 socket의 nickname 지정
      roomInfo.memberId='guest__'+socket.id;
      socket.nickname = roomInfo.memberId;
      console.log('check socket_nickname in joinRoomEvent_02 ...' + socket.nickname);
    }
    if(roomInfo.prev == roomInfo.cur){
      socket.join(roomInfo.prev);
      io.to(roomInfo.prev).emit('chat message', roomInfo.memberId+"님이 입장하셨습니다.");
    }else{
      io.to(roomInfo.prev).emit('chat message', roomInfo.memberId+"님이 퇴장하셨습니다.");
      socket.leave(roomInfo.prev);
      socket.join(roomInfo.cur);
      io.to(roomInfo.cur).emit('chat message', roomInfo.memberId+"님이 입장하셨습니다.");
    }
  });
  socket.on('chat message', (msg) => {
    var memberId;
    if(msg.memberId!='tempMember'){
      memberId = msg.memberId;
    }else{
      memberId = 'guest__'+socket.id;
    }
  //  io.to(msg.roomName).emit('chat message', memberId+' : '+msg.messageContent);
  //  io.to(msg.roomName).emit('chat message', stringHandling(memberId, msg));
    messageHandling(memberId, msg, socket);
  });
});

function messageHandling(memberId, msg, socket){
  var firstArgument="";
  var secondArgument="";
  var socketList = io.sockets.sockets; // 소켓 리스트_ 소켓 아이디로 소켓의 정보를 가져올 수 있음
  if(msg.messageContent!=""){   // 메시지가 비어있는 경우가 아니라면 첫번째 인자 추출
    var tempMsg = msg.messageContent.split(" ");
    firstArgument = tempMsg[0];
    console.log("firstArgument ... " + firstArgument);
  }
  if(firstArgument!=""){        // 첫번쨰 인자가 있는지 확인
    if(firstArgument[0]=="/"){  // 명령어 처리 부분 시작 ---
      console.log("start with '/' ... ");

      if(firstArgument=="/help" || firstArgument=="/도움말" || firstArgument=="/h"){   // 도움말 처리 시작 ---
        console.log("help ...");
        io.to(socket.id).emit('chat message', 'help messageContent ...');
        
        return;
      }                                                                             // 도움말 처리 끝 ---
      if(firstArgument=="/w"){   // 귓속말 처리 시작 ---
        console.log("whispering ...");
        secondArgument = tempMsg[1]; // 귓속말의 대상이 있는지 확인하는데 사용
        thridArgument = tempMsg[2]; // 귓속말의 내용이 있는지 확인하는데 새용
        var whisperContent="";
        console.log('tempMsg 배열의 길이' + tempMsg.length);
        for(var i=2; i<tempMsg.length; i++){
          whisperContent +=tempMsg[i] + " ";
          console.log(tempMsg);
          console.log(i+'의 tempMsg 내용 : ' + tempMsg[i]);
        }
        if(secondArgument==undefined || thridArgument==undefined){
          console.log('secondArgument or thridArgument undefined ... ');
          io.to(socket.id).emit('chat message', '귓속말 형식 => /w 상대방닉네임 내용');
          return;
        }

        io.clients(function(error, clients) { // 현재 접속중인 socket의 목록을 다 가져옴
          if (error) throw error;
          console.log(clients); // => [6em3d4TJP8Et9EMNAAAA, G5p55dHhGgUnLUctAAAB] // string 배열 형태로 socket의 id를 가져옴
          console.log('print socketNickname in socketList ...');
          for (var i=0; i<clients.length; i++){ // 현재 접속중인 socket들을 하나씩 확인함
            console.log(socketList[clients[i]].nickname);
            if(socketList[clients[i]].nickname == secondArgument){ // socket의 nickname이 귓속말의 대상과 같다면 메시지를 전달함
              console.log('nickname이 귓속말의 대상과 일치하는 socket의 socketId : ' + socketList[clients[i]].id);
              io.to(socketList[clients[i]].id).emit('chat message', socket.id + "님의 귓속말 : " + whisperContent);
            }
          }
          console.log('print socketNickname in socketList ...');
        });
        return;
      }                          // 귓속말 처리 끝 ---
      io.to(socket.id).emit('chat message', '적절하지 않은 명령어입니다.');    
      return;
    }                           // 명령어 처리 부분 끝 ---

  }
  io.to(msg.roomName).emit('chat message', memberId+' : '+msg.messageContent);
}


