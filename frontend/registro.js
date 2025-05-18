document.getElementById('register-form').addEventListener('submit', async (e) => {
    e.preventDefault();

    const datos = {
        nombre: e.target.nombre.value,
        apellidos: e.target.apellidos.value,
        email: e.target.email.value,
        password: e.target.password.value,
        telefono: e.target.telefono.value
    };

    try {
        const res = await fetch('http://localhost:3000/registro', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(datos)
        });

        const data = await res.json();

        if (res.ok) {
            alert(data.mensaje);
            window.location.href = 'login.html';
        } else {
            alert(data.mensaje || 'El usuario ya está registrado. Intenta con otro correo.');
        }
    } catch (error) {
        alert('Error al registrar usuario. Intenta de nuevo.');
    }
});
