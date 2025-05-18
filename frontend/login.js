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
            localStorage.setItem('logueado', 'true'); // <-- Agrega esta línea
            alert(data.message);
            window.location.href = 'tienda.html';
            return; // Detiene la ejecución después de redirigir
        } else {
            alert(data.error || 'Error al iniciar sesión');
        }
    } catch (error) {
        console.error('Error al hacer login:', error);
        alert('Error al hacer login');
    }
});
