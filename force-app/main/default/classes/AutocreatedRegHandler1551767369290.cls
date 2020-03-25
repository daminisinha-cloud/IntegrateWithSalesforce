global class AutocreatedRegHandler1551767369290 implements Auth.RegistrationHandler{
global boolean canCreateUser(Auth.UserData data) {
    //TODO: Check whether we want to allow creation of a user with this data
    //Set<String> s = new Set<String>{'usernamea', 'usernameb', 'usernamec'};
    //if(s.contains(data.username)) {
        //return true;
    //}
    return false;
}

global User createUser(Id portalId, Auth.UserData data){
    user u =[Select ID From user where logn_user__c =:data.username];
    return u;
}

global void updateUser(Id userId, Id portalId, Auth.UserData data){

}
}