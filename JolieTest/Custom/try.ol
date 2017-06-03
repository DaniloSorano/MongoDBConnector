include "../public/interfaces/MongoDbConnector.iol"
include "db_services/users_service/interfaces/usersInterface.iol"
include "console.iol"
include "string_utils.iol"


inputPort UserService {
  Location : "socket://localhost:8100"
  Protocol : sodep
  Interfaces : MongoDBInterface, usersInterface
}

execution{ concurrent }

init{
  scope (ConnectionMongoDbScope){
    install (defaulta => valueToPrettyString@StringUtils(ConnectionMongoDbScope)();
             println@Console(s)()
             );
    with (connectValue){
        .host = "localhost";
        .dbname ="prova";
        .port = 27017;
        .timeZone = "Europe/Rome";
        .jsonStringDebug = true
      };
    connect@MongoDB(connectValue)()
}
}

main
{
  [createusers( users )(){
    println@Console( "string" )()
  }]{nullProcess}
}
