document.addEventListener('DOMContentLoaded', () => {
    const botones = document.querySelectorAll('.btn-add-carrito');
    botones.forEach(boton => {
        boton.addEventListener('click', () => {
            // Verifica si el usuario está logueado
            if (localStorage.getItem('logueado') !== 'true') {
                alert('Debes iniciar sesión para agregar productos al carrito.');
                window.location.href = 'login.html';
                return;
            }
            const id = boton.getAttribute('data-id');
            const titulo = boton.getAttribute('data-titulo');
            const precio = boton.getAttribute('data-precio');
            let carrito = JSON.parse(localStorage.getItem('carrito')) || [];
            const index = carrito.findIndex(item => item.id === id);
            if (index >= 0) {
                carrito[index].cantidad += 1;
            } else {
                carrito.push({ id, titulo, precio, cantidad: 1 });
            }
            localStorage.setItem('carrito', JSON.stringify(carrito));
            alert('Producto agregado al carrito');
        });
    });
});