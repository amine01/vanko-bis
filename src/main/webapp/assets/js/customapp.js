// get the form values  
function collectFormData(fields) {
	var data = {};
	for (var i = 0; i < fields.length; i++) {
		var $item = $(fields[i]);
		data[$item.attr('name')] = $item.val();
		console.log($item.attr('name') + " ---> " + $item.val());
	}
	return data;
}

$(document)
		.ready(
				function() {
					var $form = $('#add-personne-form');
					$form
							.bind(
									'submit',
									function(e) {
										// Ajax validation

										var $inputs = $form.find(':input');

										var data = collectFormData($inputs);
										console.log("Data --> " + data);
										$
												.ajax({
													url : "personne.json",
													data : data,
													type : 'POST',
													success : function(response) {
														if (response.status == 'FAIL') {

															console.log("FAIL");

															$form
																	.find(
																			'.help-inline')
																	.empty();

															for (var i = 0; i < response.errorMessageList.length; i++) {
																var item = response.errorMessageList[i];
																var $controlGroup = $('div[id="'
																		+ item.fieldName
																		+ '"]');
																$controlGroup
																		.addClass('error');
																$controlGroup
																		.find(
																				'.help-inline')
																		.html(
																				item.message);
																console
																		.log(item.fieldName
																				+ " --> "
																				+ item.message);
															}

														} else { // response.status
															// != FAIL

															console
																	.log(response.status);
															$form
																	.unbind('submit');
															$form.submit();
														}
													}// fin success
												});
										e.preventDefault();
										return false;
									});
				});
// ##################################################################################################################################################

var countSurnom = 1;
function addSurnom() {

	var div = document.createElement("div");
	div.setAttribute("id", "surnoms[" + countSurnom + "].surnom");
	div.className = "form-group";
	/*  */
	div.innerHTML = "<hr width='50%'><lable class='col-sm-2 control-label'><strong>Surnom</strong></lable><div class='col-sm-5'><input placeholder='Surnom' type='text' name='surnoms["
			+ countSurnom
			+ "].surnom' id='surnom' class='form-control'/></div><div class='col-sm-1'><span class='help-inline'></span></div>";

	// lien de suppression du variable
	countSurnom++;
	var removeSurnom = document.createElement('a');
	removeSurnom.className = "btn btn-danger";
	removeSurnom.href = "";
	removeSurnom.innerHTML = "<span class='glyphicon glyphicon-minus'></span>";

	div.appendChild(removeSurnom);

	document.getElementById('sr').appendChild(div);

	removeSurnom.addEventListener('click', function(event) {
		countSurnom--;

		div.parentElement.removeChild(div);
		removeSurnom.parentElement.removeChild(removeSurnom);
		event.preventDefault();
	});

}

var countPhoto = 1;
function addPhoto() {

	var div = document.createElement("div");
	div.setAttribute("id", "photos[" + countPhoto + "].file");
	div.className = "form-group";
	div.innerHTML = "<lable class='col-sm-2 control-label'>Photo :</lable>"
			+ "<div class='col-sm-4'><input class='form-control' type='file' name='photos["
			+ countPhoto + "].file'/></div>"
			+ "<div col-sm-6><span class='help-inline'></span></div>";

	countPhoto++;
	var removePhoto = document.createElement('a');
	removePhoto.appendChild(document.createTextNode("remove"));
	removePhoto.className = "btn btn-danger";
	removePhoto.href = "#";
	removePhoto.innerHTML = "<span class='glyphicon glyphicon-minus'></span>";

	document.getElementById('photos').appendChild(div);
	document.getElementById('photos').appendChild(removePhoto);

	removePhoto.addEventListener('click', function(event) {
		countPhoto--;

		div.parentElement.removeChild(div);
		removePhoto.parentElement.removeChild(removePhoto);
		event.preventDefault();
	});
}

var countEmail = 1;
function addEmail() {

	var divemail = document.createElement("div");
	divemail.setAttribute("id", "mails[" + countEmail + "].email");
	divemail.className = "form-group";

	var divpola = document.createElement("div");
	divpola.setAttribute("id", "mails[" + countEmail + "].polar");
	divpola.className = "form-group";
	/*  */
	divemail.innerHTML = "<hr width='50%'><lable class='col-sm-2 control-label'><strong>E-mail</strong></lable><div class='col-sm-6'><input placeholder='E-mail' class='form-control' type='text' name='mails["
			+ countEmail
			+ "].email'/></div><div class='col-sm-4'><span class='help-inline'></span></div>";

	divpola.innerHTML = "<lable class='col-sm-2 control-label'><strong>Polariser</strong></lable><div class='col-sm-2'><select class='form-control' name='mails["
			+ countEmail
			+ "].polar'><option value=''></option><option value='Oui'>Oui</option><option value='Non'>Non</option></select></div><div col-sm-6><span class='help-inline'></span>";

	// lien de suppression du variable
	countEmail++;
	var removeEmail = document.createElement('a');
	removeEmail.className = "btn btn-danger";
	removeEmail.href = "#";
	removeEmail.innerHTML = "<span class='glyphicon glyphicon-minus'></span>";

	divpola.appendChild(removeEmail);

	document.getElementById('mails').appendChild(divemail);
	document.getElementById('mails').appendChild(divpola);

	removeEmail.addEventListener('click', function(event) {
		countEmail--;
		divemail.parentElement.removeChild(divemail);
		divpola.parentElement.removeChild(divpola);
		removeEmail.parentElement.removeChild(removeEmail);
		event.preventDefault();
	});

}

var countFonction = 1;
function addFonction() {

	var divfonction = document.createElement("div");
	divfonction.setAttribute("id", "personneFonctions[" + countFonction
			+ "].fonction.fonction");
	divfonction.className = "form-group";

	var divdd = document.createElement("div");
	divdd.setAttribute("id", "personneFonctions[" + countFonction
			+ "].dateDebut");
	divdd.className = "form-group";

	var divdf = document.createElement("div");
	divdf
			.setAttribute("id", "personneFonctions[" + countFonction
					+ "].dateFin");
	divdf.className = "form-group";

	divfonction.innerHTML = "<hr width='50%'><lable class='col-sm-2 control-label'><strong>Fonction</strong></lable><div class='col-sm-6'><input placeholder='Fonction' class='form-control' type='text' name='personneFonctions["
			+ countFonction
			+ "].fonction.fonction'/></div><div class='col-sm-4'><span class='help-inline'></span></div>";

	divdd.innerHTML = "<lable class='col-sm-2 control-label'><strong>Date de debut</strong></lable><div class='col-sm-5'><input type='text' class='form-control dp' name='personneFonctions["
			+ countFonction
			+ "].dateDebut' data-date-format='dd/mm/yyyy' value=''/></div><div class='col-sm-4'><span class='help-inline'></span><div>";

	$("#personneFonctions[1].fonction.fonction input").datepicker();

	divdf.innerHTML = "<lable class='col-sm-2 control-label'><strong>Date de fin</strong></lable><div class='col-sm-5'><input type='text' class='form-control dp' name='personneFonctions["
			+ countFonction
			+ "].dateFin'/></div><div class='col-sm-4'><span class='help-inline'></span></div>";

	countFonction++;
	var removeFonctionPersonne = document.createElement('a');
	removeFonctionPersonne.href = "#";
	removeFonctionPersonne.className = "btn btn-danger";
	removeFonctionPersonne.innerHTML = "<span class='glyphicon glyphicon-minus'></span>";

	divdf.appendChild(removeFonctionPersonne);

	document.getElementById('fonctions').appendChild(divfonction);
	document.getElementById('fonctions').appendChild(divdd);
	document.getElementById('fonctions').appendChild(divdf);

	$('[class*=" dp"]').datepicker();

	removeFonctionPersonne.addEventListener('click', function(event) {
		countFonction--;

		divfonction.parentElement.removeChild(divfonction);
		divdd.parentElement.removeChild(divdd);
		divdf.parentElement.removeChild(divdf);
		removeFonctionPersonne.parentElement
				.removeChild(removeFonctionPersonne);
		event.preventDefault();
	});
}
// #################
function beforeSubmit(arr, $form, options) {
	var fileDataIndex = -1;

	$.each(arr, function(index, value) {
		if (value.name == "fileData") {
			if (value.value.length == 0) {
				fileDataIndex = index;
			}
		}
	});

	if (fileDataIndex != -1) {
		arr.remove(fileDataIndex);
	}
}
