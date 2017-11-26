export const Accordion = {
  methods: {
    toggleAccordion (event) {
      let parentEl = event.target.parentElement;

      if (parentEl.classList.contains('accordion--closed')) {
        parentEl.classList.replace('accordion--closed', 'accordion--open');
      } else {
        parentEl.classList.replace('accordion--open', 'accordion--closed');
      }
    }
  }
};