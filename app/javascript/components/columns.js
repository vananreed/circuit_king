function toggleIcon(icon) {
  if (icon.classList.contains("fa-plus")) {
    icon.classList.remove("fa-plus");
    icon.classList.add("fa-times");
  } else {
    icon.classList.add("fa-plus");
    icon.classList.remove("fa-times");
  }
};


function moveExercise(e) {
toggleIcon(e.toElement);
const listItem = e.toElement.parentElement.outerHTML;
const selectedList = document.querySelector(".selected-exercises-list");
const unselectedList = document.querySelector(".unselected-exercises-list");
if (e.toElement.parentElement.parentElement.classList[0] === "selected-exercises-list") {
  unselectedList.insertAdjacentHTML("afterbegin", listItem);
} else {
  selectedList.insertAdjacentHTML("beforeend", listItem);
};
e.toElement.parentElement.remove()
initColumns();
};

function initColumns() {
  const exercisesButtons = document.querySelectorAll(".homepage-exercise-item i");
  exercisesButtons.forEach(button => {
    button.addEventListener("click", moveExercise)
  });
};

export { initColumns };
