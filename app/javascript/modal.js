document.addEventListener('DOMContentLoaded', ()=>{

  const addModal = ()=>{
    const modal = document.getElementById('modal');
    const backGround = document.getElementById('modal-back-ground');
    

    modal.style.display='block';

    backGround.addEventListener('click',()=>{
      modal.style.display='none';
    });
  }


  if(document.URL.match(/edit/)){

    const deleteUser = document.getElementById('delete-user');
    const deletePost = document.getElementsByClassName("delete-post");
    

    deleteUser.addEventListener('click', ()=>{
      addModal();
    });

    for(let i=0; i < deletePost.length; i++){
      deletePost[i].addEventListener('click',()=>{
        addModal();
      });
    }
  };

  if(document.URL.match(/books/)){
    const deleteComment = document.getElementsByClassName("delete-comment")
    
    for(let i=0; i < deleteComment.length; i++){
      deleteComment[i].addEventListener('click',()=>{
        addModal();
      });
    }
  };
});


  