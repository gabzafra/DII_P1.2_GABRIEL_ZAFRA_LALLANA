function sendDelete(url) {
  fetch(url, { method: "DELETE" }).then(res => {
    if (res.status == 200) {
      window.location = window.location.pathname;
    } else {
      window.location.search = '?error=""';
    }
  });
}
function sendPut(form) {
  const url = form.action;
  const inputList = document.getElementsByTagName("input");
  const comentsArea = document.getElementsByTagName("textarea").coments;
  const formData = new FormData();
  formData.append("name", inputList.name.value);
  formData.append("surnames", inputList.surnames.value);
  formData.append("email", inputList.email.value);
  formData.append("phone", inputList.phone.value);
  formData.append("coments", comentsArea.innerHTML);

  fetch(url, {method: 'PUT',body: formData}).then(res => {
    if(res.status == 200){
      console.log(res);
    } else {
      window.location.search += '?error=""';
    }
  })
}
