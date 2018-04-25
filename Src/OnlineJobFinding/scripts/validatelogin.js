

function ValidateLogin() {
    if ($("[id$='txtUserName']").val().length == 0) {
        alert("لطفا نام كاربري خود را وارد كنيد.");
        return false;
    }
    if ($("[id$='txtPassword']").val().length == 0) {
        alert("لطفا كلمه عبور خود را وارد كنيد.");
        return false;
    }
    return true;
}