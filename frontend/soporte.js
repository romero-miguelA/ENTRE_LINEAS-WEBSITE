document.getElementById('form-soporte').addEventListener('submit', function(e) {
    e.preventDefault();

    const pqr = {
        nombre: document.getElementById('nombre').value,
        email: document.getElementById('email').value,
        asunto: document.getElementById('asunto').value,
        mensaje: document.getElementById('mensaje').value,
        fecha: new Date().toLocaleString()
    };

    let pqrs = JSON.parse(localStorage.getItem('pqrs')) || [];
    pqrs.push(pqr);
    localStorage.setItem('pqrs', JSON.stringify(pqrs));

    alert('¡Tu mensaje ha sido enviado y guardado correctamente!');
    console.log('PQR enviada:', pqr);
    this.reset();
});