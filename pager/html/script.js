window.addEventListener('message', (event) => {
    const data = event.data;

    if (data.action === 'showNotification') {
        showNotification(data.message);
    }
});

const pagerElement = document.getElementById('pager');
const textElement = document.getElementById('text');
const audio = new Audio('pager_beeps.mp3');
audio.volume = 0.3;

function showNotification(message) {
    textElement.textContent = message;
    pagerElement.style.display = 'block';
    audio.play();

    // Play sound for 2.5 seconds only
    setTimeout(() => {
        audio.pause();
        audio.currentTime = 0;
    }, 2500);

    // Hide notification after 30 seconds
    setTimeout(() => {
        pagerElement.style.display = 'none';
    }, 30000);
}
