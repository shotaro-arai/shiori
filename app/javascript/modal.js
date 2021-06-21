document.addEventListener('DOMContentLoaded', ()=>{
  if(document.URL.match(/edit/)){

    const addModal = ()=>{
      const modal = document.getElementById('modal');
      const backGround = document.getElementById('modal-back-ground');
      

      modal.style.display='block';

      backGround.addEventListener('click',()=>{
        modal.style.display='none';
      });
    }

    const deleteUser = document.getElementById('delete-user');
    const deletePost = document.getElementsByClassName("delete-btn delete-post");

    deleteUser.addEventListener('click', ()=>{
      addModal();
    });

    for(let i=0; i < deletePost.length; i++){
      deletePost[i].addEventListener('click',()=>{
        addModal();
      });
    }
  };
});