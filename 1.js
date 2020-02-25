// определение устройства
document.querySelector('#out').innerHTML = navigator.userAgent;
console.log(navigator);

if (navigator.userAgent.match('Android') || navigator.userAgent.match('iPhone') || navigator.userAgent.match('iPad') || navigator.userAgent.match('RIM')) {
    alert('mobile');
}
else {
    alert('Desktop');
}
