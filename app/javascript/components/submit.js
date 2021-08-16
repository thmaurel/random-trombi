const submit = () => {
  const btnSubmit = document.querySelector('#submit-btn')
  btnSubmit.addEventListener('click', (event) => {
    event.preventDefault();
  })
}

export default submit;
