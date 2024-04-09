document.addEventListener('DOMContentLoaded', function() {
    const categorySelect = document.getElementById('herding_category');
    const pointsField = document.getElementById('points-field');
    const otherFields = document.querySelector('.other-fields');
  
    // Reset form elements to their initial state
    resetForm();
  
    categorySelect.addEventListener('change', function() {
      const selectedCategory = this.value;
  
      if (selectedCategory === 'NHAT') {
        pointsField.classList.add('hidden');
        otherFields.classList.add('hidden');
      } else if (selectedCategory === 'HWT') {
        pointsField.classList.remove('hidden');
        otherFields.classList.add('hidden');
      } else {
        pointsField.classList.remove('hidden');
        otherFields.classList.remove('hidden');
      }
    });
  
    // Function to reset form elements to their initial state
    function resetForm() {
      const selectedCategory = categorySelect.value;
  
      if (selectedCategory === 'NHAT') {
        pointsField.classList.add('hidden');
        otherFields.classList.add('hidden');
      } else if (selectedCategory === 'HWT') {
        pointsField.classList.remove('hidden');
        otherFields.classList.add('hidden');
      } else {
        pointsField.classList.remove('hidden');
        otherFields.classList.remove('hidden');
      }
    }
  });
  