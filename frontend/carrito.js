document.addEventListener('DOMContentLoaded', () => {
    const cartItemsDiv = document.getElementById('cart-items');
    const cartEmptyDiv = document.getElementById('cart-empty');
    const totalItemsSpan = document.getElementById('total-items');
    const shippingCostSpan = document.getElementById('shipping-cost');
    const totalPriceSpan = document.getElementById('total-price');
    const checkoutButton = document.getElementById('checkout-button');

    function renderCarrito() {
        let carrito = JSON.parse(localStorage.getItem('carrito')) || [];
        cartItemsDiv.innerHTML = '';
        let totalItems = 0;
        let totalPrice = 0;

        if (carrito.length === 0) {
            cartEmptyDiv.style.display = 'block';
            totalItemsSpan.textContent = '0';
            shippingCostSpan.textContent = '$0.00';
            totalPriceSpan.textContent = '$0.00';
            return;
        } else {
            cartEmptyDiv.style.display = 'none';
        }

        carrito.forEach((item, idx) => {
            totalItems += item.cantidad;
            totalPrice += item.cantidad * parseInt(item.precio);

            const itemDiv = document.createElement('div');
            itemDiv.className = 'cart-item';
            itemDiv.innerHTML = `
                <span class="cart-title">${item.titulo}</span>
                <span class="cart-cantidad">x${item.cantidad}</span>
                <span class="cart-price">$${parseInt(item.precio).toLocaleString()} COP</span>
                <button class="btn-delete" data-idx="${idx}">Eliminar</button>
            `;
            cartItemsDiv.appendChild(itemDiv);
        });

        totalItemsSpan.textContent = totalItems;
        shippingCostSpan.textContent = '$0.00';
        totalPriceSpan.textContent = `$${totalPrice.toLocaleString()} COP`;
    }

    // Eliminar una unidad del producto
    cartItemsDiv.addEventListener('click', (e) => {
        if (e.target.classList.contains('btn-delete')) {
            let carrito = JSON.parse(localStorage.getItem('carrito')) || [];
            const idx = e.target.getAttribute('data-idx');
            if (carrito[idx].cantidad > 1) {
                carrito[idx].cantidad -= 1;
            } else {
                carrito.splice(idx, 1);
            }
            localStorage.setItem('carrito', JSON.stringify(carrito));
            renderCarrito();
        }
    });

    // Botón de pago
    checkoutButton.addEventListener('click', () => {
        let carrito = JSON.parse(localStorage.getItem('carrito')) || [];
        if (carrito.length === 0) {
            alert('El carrito está vacío.');
            return;
        }
        alert('¡Gracias por tu compra!');
        localStorage.removeItem('carrito');
        renderCarrito();
    });

    renderCarrito();
});