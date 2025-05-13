// frontend/login.js
document.getElementById('login-form').addEventListener('submit', async function (e) {
    e.preventDefault();

    const email = document.getElementById('email').value.trim();
    const password = document.getElementById('password').value.trim();

    try {
        const response = await fetch('http://localhost:3000/login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ email, password })
        });

        const data = await response.json();

        if (response.ok) {
            alert(data.message);
            // Redireccionar o guardar info en localStorage si es necesario
            window.location.href = 'index.html'; // o donde desees llevarlo tras el login
            messages.success('Inicio de sesión exitoso');
        } else {
            alert(data.error || 'Error al iniciar sesión');
        }
    } catch (error) {
        console.error('Error de red:', error);
        alert('Error de conexión con el servidor');
    }
});
