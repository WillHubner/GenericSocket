# GenericSocket

Class to trade socket messages 
Componente para troca de mensagens socket seguindo o modelo socketIO.

## Installation ->
Installation is done using the [`boss install`](https://github.com/HashLoad/boss) command:
``` sh
boss install willhubner/GenericSocket
```

## How to use ->

```delphi
uses GenericSocket, GenericSocket.Interfaces;
```

* **Server Side**

```delphi
  Socket : iGenericSocket;

  Socket := TGenericSocket.New;

  Socket.SocketServer.Start;
```

* **Client Side**

```delphi
var
  ClientSocket : iGenericSocket;
begin  
  ClientSocket := TGenericSocket.New;

  ClientSocket
    .SocketClient
      .RegisterCallback('/route', route)
      .Connect('192.168.0.128', 8080, '@socket_name');

  function route(Message: String): String;
  begin
    Result := 'Callback '+Message;
  end;
end;  
```

* **Send Message and Get Callback response**

```delphi
var
  SocketResponse : iSocketMessage;
begin
  SocketResponse := Socket.SocketServer.Send(ListBox1.Items[ListBox1.ItemIndex] , '/route');
```

