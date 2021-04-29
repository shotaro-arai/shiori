// const comment = ()=>{
//   const commentSubmit = document.getElementById("comment-submit");
//   commentSubmit.addEventListener("click", (e)=>{
//     e.preventDefault();
//     const commentForm = document.getElementById("comment-form");
//     const formData = new FormData(commentForm);
//     const bookId = document.getElementById("book-id").value

//     const XHR = new XMLHttpRequest();
//     XHR.open("POST", `${bookId}/comments`, true);
//     XHR.responseType = "json";
//     XHR.send(formData)

//     XHR.onload = ()=>{
//       const comment = XHR.response.comment

//     }
//   })
// }

// window.addEventListener("load", comment)