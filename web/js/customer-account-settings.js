function checkEditName() {
    document.getElementById('btnEditName').hidden = true;
    document.getElementById('btnCancelEditName').hidden = false;
    document.getElementById('fullNameDiv').hidden = true;
    document.getElementById('fullNameForm').hidden = false;
    disableBtn(true);
}
function cancelEditName() {
    document.getElementById('btnEditName').hidden = false;
    document.getElementById('btnCancelEditName').hidden = true;
    document.getElementById('fullNameDiv').hidden = false;
    document.getElementById('fullNameForm').hidden = true;
    disableBtn(false);
}
function editEmail(isEdit) {
    if (isEdit == true) {
        document.getElementById('btnEditEmail').hidden = true;
        document.getElementById('btnCancelEditEmail').hidden = false;
        document.getElementById('emailDiv').hidden = true;
        document.getElementById('emailForm').hidden = false;
        disableBtn(true);
    } else {
        document.getElementById('btnEditEmail').hidden = false;
        document.getElementById('btnCancelEditEmail').hidden = true;
        document.getElementById('emailDiv').hidden = false;
        document.getElementById('emailForm').hidden = true;
        disableBtn(false);
    }
}
function editPhoneNumber(isEdit) {
    if (isEdit == true) {
        document.getElementById('btnEditPhoneNumber').hidden = true;
        document.getElementById('btnCancelEditPhoneNumber').hidden = false;
        document.getElementById('phoneNumberDiv').hidden = true;
        document.getElementById('phoneNumberForm').hidden = false;
        disableBtn(true);
    } else {
        document.getElementById('btnEditPhoneNumber').hidden = false;
        document.getElementById('btnCancelEditPhoneNumber').hidden = true;
        document.getElementById('phoneNumberDiv').hidden = false;
        document.getElementById('phoneNumberForm').hidden = true;
        disableBtn(false);
    }
}
function editGender(isEdit) {
    if (isEdit == true) {
        document.getElementById('btnEditGender').hidden = true;
        document.getElementById('btnCancelEditGender').hidden = false;
        document.getElementById('genderDiv').hidden = true;
        document.getElementById('genderForm').hidden = false;
        disableBtn(true);
    } else {
        document.getElementById('btnEditGender').hidden = false;
        document.getElementById('btnCancelEditGender').hidden = true;
        document.getElementById('genderDiv').hidden = false;
        document.getElementById('genderForm').hidden = true;
        disableBtn(false);
    }
}
function editDOB(isEdit) {
    if (isEdit == true) {
        document.getElementById('btnEditDOB').hidden = true;
        document.getElementById('btnCancelEditDOB').hidden = false;
        document.getElementById('dobDiv').hidden = true;
        document.getElementById('dobForm').hidden = false;
        disableBtn(true);
    } else {
        document.getElementById('btnEditDOB').hidden = false;
        document.getElementById('btnCancelEditDOB').hidden = true;
        document.getElementById('dobDiv').hidden = false;
        document.getElementById('dobForm').hidden = true;
        disableBtn(false);
    }
}
function editAddress(isEdit) {
    if (isEdit == true) {
        document.getElementById('btnEditAddress').hidden = true;
        document.getElementById('btnCancelEditAddress').hidden = false;
        document.getElementById('addressDiv').hidden = true;
        document.getElementById('addressForm').hidden = false;
        disableBtn(true);
    } else {
        document.getElementById('btnEditAddress').hidden = false;
        document.getElementById('btnCancelEditAddress').hidden = true;
        document.getElementById('addressDiv').hidden = false;
        document.getElementById('addressForm').hidden = true;
        disableBtn(false);
    }
}
function editPassword(isEdit) {
    if (isEdit == true) {
        document.getElementById('btnEditPassword').hidden = true;
        document.getElementById('btnCancelEditPassword').hidden = false;
        document.getElementById('passwordDiv').hidden = true;
        document.getElementById('passwordForm').hidden = false;
        disableBtn(true);
    } else {
        document.getElementById('btnEditPassword').hidden = false;
        document.getElementById('btnCancelEditPassword').hidden = true;
        document.getElementById('passwordDiv').hidden = false;
        document.getElementById('passwordForm').hidden = true;
        disableBtn(false);
    }
}
function editDeleteAcc(isEdit) {
    if (isEdit == true) {
        document.getElementById('btnEditDeleteAcc').hidden = true;
        document.getElementById('btnCancelEditDeleteAcc').hidden = false;
        document.getElementById('deleteAccDiv').hidden = true;
        document.getElementById('deleteAccForm').hidden = false;
        disableBtn(true);
    } else {
        document.getElementById('btnEditDeleteAcc').hidden = false;
        document.getElementById('btnCancelEditDeleteAcc').hidden = true;
        document.getElementById('deleteAccDiv').hidden = false;
        document.getElementById('deleteAccForm').hidden = true;
        disableBtn(false);
    }
}
function disableBtn(isDisable) {
    const collection = document.getElementsByClassName("btnEdit");
    if (isDisable == true) {
        collection[0].style.pointerEvents = "none";
        collection[1].style.pointerEvents = "none";
        collection[2].style.pointerEvents = "none";
        collection[3].style.pointerEvents = "none";
        collection[4].style.pointerEvents = "none";
        collection[5].style.pointerEvents = "none";
//        collection[0].style.display = "none";
//        collection[1].style.display = "none";
//        collection[2].style.display = "none";
//        collection[3].style.display = "none";
//        collection[4].style.display = "none";
//        collection[5].style.display = "none";
    } else {
        collection[0].style.pointerEvents = "auto";
        collection[1].style.pointerEvents = "auto";
        collection[2].style.pointerEvents = "auto";
        collection[3].style.pointerEvents = "auto";
        collection[4].style.pointerEvents = "auto";
        collection[5].style.pointerEvents = "auto";
//        collection[0].style.display = "block";
//        collection[1].style.display = "block";
//        collection[2].style.display = "block";
//        collection[3].style.display = "block";
//        collection[4].style.display = "block";
//        collection[5].style.display = "block";
    }
}