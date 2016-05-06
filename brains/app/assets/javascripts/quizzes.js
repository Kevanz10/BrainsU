$(document).ready(function(e) {
	// Options for deeper nested fields
	resourcesOptions = {
	  itemSelector: ".option",
	  containerSelector: ".options-container",
	  addSelector: ".option-add",
	  removeSelector: ".option-remove",
	  itemTemplateSelector: ".option.template", // Identifies which template to use
	  newItemIndex: "new_option_item" // Same used on view options
	};

	$(".quiz-form").nestedFields({
	  itemSelector: ".question",
	  containerSelector: ".questions-container",
	  addSelector: ".question-add",
	  removeSelector: ".question-remove",
	  itemTemplateSelector: ".question.template",
	  newItemIndex: "new_question_item",
	  afterInsert: function(item) {
	  	// Applies nestedFields to this task's resources (deeper field)
	    item.find(".nested-level-2").nestedFields(resourcesOptions);
	    // Inserts a resource item (of the deeper field)
	    item.find(".nested-level-2").nestedFields("insert");
	  }
	});

	$(".quiz-form").find(".nested-level-2").nestedFields(resourcesOptions);

	$(".quiz-form").on("click", ".option-correct", function(e){
		debugger;
		option_id = $(this).siblings('.option_id').val()
		option_id = parseInt(option_id)
		$(this).parent().siblings('.highlight').removeClass('highlight')
		$(this).parent().siblings('.correct-option').val(option_id)
		$(this).parent().addClass('highlight')
		e.preventDefault();
	});
});
