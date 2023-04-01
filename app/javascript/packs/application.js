// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'bootstrap'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

//= require parallax.min

document.addEventListener('turbolinks:load', () => {
  const fightsWrapper = document.getElementById('fights-wrapper');
  const addFightLink = document.getElementById('add-fight');
  const newFightTemplate = document.getElementById('new-fight-template');

  if (fightsWrapper && addFightLink && newFightTemplate) {
    addFightLink.addEventListener('click', (event) => {
      event.preventDefault();

      const newFight = newFightTemplate.firstElementChild.cloneNode(true);
      const newId = new Date().getTime();

      newFight.innerHTML = newFight.innerHTML.replaceAll('new_fight', newId);
      fightsWrapper.appendChild(newFight);

      bindRemoveFightHandler(newFight.querySelector('.remove-fight'));
    });

    const removeFightLinks = document.querySelectorAll('.remove-fight');
    removeFightLinks.forEach((link) => {
      bindRemoveFightHandler(link);
    });
  }
});

function bindRemoveFightHandler(removeFightLink) {
  removeFightLink.addEventListener('click', (event) => {
    event.preventDefault();

    const fightDiv = event.target.closest('.fight');
    const destroyField = fightDiv.querySelector('input[name*="_destroy"]');
    if (destroyField) {
      destroyField.value = '1';
      fightDiv.style.display = 'none';
    } else {
      fightDiv.remove();
    }
  });
}
