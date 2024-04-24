function afficherDescription(index) {
    var descrip = document.getElementById('description' + index);
    if (descrip.style.display === 'none') {
        descrip.style.display = 'block';
    } else {
        descrip.style.display = 'none';
    }
}
