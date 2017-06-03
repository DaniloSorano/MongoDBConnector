include "interfaces/usersInterface.iol"
include "console.iol"
include "string_utils.iol"

outputPort UserService {
  Location : "socket://localhost:8100"
  Protocol : sodep
  Interfaces : usersInterface
}

main{
    createusersRequest.name.first = "Danilo";
    createusersRequest.name.last = "Sorano";
    createusersRequest.age = 22;
    createusers@UserService(createusersRequest)();
    /*updateusersRequest.filter.age = 22;
    updateusersRequest.filter.age.operation.gteq = true;
    updateusersRequest.documentUpdate.name.first = "Carlo";
    updateusers@UserService(updateusersRequest)();*/

    queryusersRequest.filter.name.first = "Danilo";
    queryusers@UserService(queryusersRequest)()
}
