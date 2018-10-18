function moveExercise(e) {
const listItem = e.toElement.parentElement.outerHTML;
const selectedList = document.querySelector(".selected-exercises-list");
selectedList.insertAdjacentHTML("afterbegin", listItem);
e.toElement.parentElement.remove()
};

function initColumns() {
  const exercisesButtons = document.querySelectorAll(".homepage-exercise-item i");
  exercisesButtons.forEach(button => {
    button.addEventListener("click", moveExercise)
  });
};

export { initColumns };
