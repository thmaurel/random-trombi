const submit = () => {
  const container = document.querySelector('.random-container')
  const id = container.dataset.profile
  const btnSubmit = document.getElementById('submit-btn')
  const name = document.getElementById('name')
  const activity = document.getElementById('activity')
  const answerContainer = document.querySelector('.random-form-answer')
  console.log(btnSubmit)
  btnSubmit.addEventListener('click', (event) => {
    event.preventDefault();
    fetch(`/profiles/${id}/correct?name=${name.value}&activity=${activity.value}`)
      .then(response => response.json())
      .then((data) => {
        if (data.status === "won") {
          answerContainer.innerHTML = "<p class=\"correct-answer\">Gagné!</p>"
          setTimeout(() => {document.location.href= "/random";}, 2000)
        } else {
          console.log("c'est perdu!")
          const nameContainer = document.querySelector('.random-form-name')
          const activityContainer = document.querySelector('.random-form-activity')
          nameContainer.innerText = data.name
          activityContainer.innerText = data.activity
          answerContainer.innerHTML = "<p class=\"answer\">Perdu! Suivant dans 4s!</p>"
          setTimeout(() => {answerContainer.innerHTML = "<p class=\"answer\">Perdu! Suivant dans 3s!</p>"}, 1000)
          setTimeout(() => {answerContainer.innerHTML = "<p class=\"answer\">Perdu! Suivant dans 2s!</p>"}, 2000)
          setTimeout(() => {answerContainer.innerHTML = "<p class=\"answer\">Perdu! Suivant dans 1s!</p>"}, 3000)
          setTimeout(() => {answerContainer.innerHTML = "<p class=\"answer\">Perdu! Suivant dans 0s!</p>"}, 4000)
          setTimeout(() => {document.location.href= "/random";}, 4000)
        }
      });
  })
}

export default submit;
