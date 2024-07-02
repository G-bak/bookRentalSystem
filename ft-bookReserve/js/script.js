const buttonReserveStatus = document.querySelector('.btn-reserve-status');
const reserveStatusContainer = document.querySelector('.reserve-status-container');
const buttonReserveClose = document.querySelector('.btn-reserve-status-container-close');
const buttonBookReserve = document.querySelector('.btn-book-reserve');
const bookReserveContainer = document.querySelector('.book-reserve-container');
const buttonBookClose = document.querySelector('.btn-book-reserve-container-close');
const buttonReserveExpirationStatus = document.querySelector('.btn-reserve-expiration-status');
const reserveExpirationStatusContainer = document.querySelector('.reserve-expiration-status-container');
const buttonReserveExpirationClose = document.querySelector('.btn-reserve-expiration-status-container-close');
const reserveContainer = document.querySelector('.reserve-container');
const reserveContainer2 = document.querySelector('.reserve-container2');
const buttonReserveClose2 = document.querySelector('.btn-reserve-container-close');
const buttonReserveClose3 = document.querySelector('.btn-reserve-container-close2');
const buttonReserve = document.getElementById('btn-reserve');
const buttonReserve2 = document.getElementById('btn-reserve2');
const bookQuantityRentalStatusContainer = document.querySelector('.book-quantity-rental-status-container');
const buttonBookQuantityRentalStatus = document.querySelector('.btn-book-quantity-rental-status');
const buttonBookQuantityRentalStatusClose = document.querySelector('.btn-book-quantity-rental-status-container-close');


buttonReserveStatus.addEventListener('click', selectReserveStatus);
buttonReserveClose.addEventListener('click', closeReserveStatus);
buttonBookReserve.addEventListener('click', selectBookReserve);
buttonBookClose.addEventListener('click', closeBookReserve);
buttonReserveExpirationStatus.addEventListener('click', selectReserveExpirationStatus);
buttonReserveExpirationClose.addEventListener('click', closeReserveExpirationStatus);
buttonReserve.addEventListener('click', selectReserve);
buttonReserve2.addEventListener('click', selectReserve2);
buttonReserveClose2.addEventListener('click', closeReserve);
buttonReserveClose3.addEventListener('click', closeReserve2);
buttonBookQuantityRentalStatus.addEventListener('click', selectBookQuantityRentalStatus);
buttonBookQuantityRentalStatusClose.addEventListener('click', closeBookQuantityRentalStatus);

function selectReserveStatus() {
    reserveStatusContainer.style.display = 'flex';
}

function closeReserveStatus() {
    reserveStatusContainer.style.display = 'none';
}

function selectBookReserve() {
    bookReserveContainer.style.display = 'flex';
}

function closeBookReserve() {
    bookReserveContainer.style.display = 'none';
}

function selectReserveExpirationStatus() {
    reserveExpirationStatusContainer.style.display = 'flex';
}

function closeReserveExpirationStatus() {
    reserveExpirationStatusContainer.style.display = 'none';
}

function selectReserve() {
    reserveContainer.style.display = 'flex';
}

function selectReserve2() {
    reserveContainer2.style.display = 'flex';
}

function closeReserve() {
    reserveContainer.style.display = 'none';
}

function closeReserve2() {
    reserveContainer2.style.display = 'none';
}

function selectBookQuantityRentalStatus() {
    bookQuantityRentalStatusContainer.style.display = 'flex';
}

function closeBookQuantityRentalStatus() {
    bookQuantityRentalStatusContainer.style.display = 'none';
}

// 예시: 페이지 로드 후 특정 조건에 따라 스크롤 추가
document.addEventListener('DOMContentLoaded', function() {
    const thCell = document.querySelector('.td'); // 첫 번째 td 요소 선택
    const divScrollable = thCell.querySelector('.scrollable-content');

    if (divScrollable.scrollWidth > divScrollable.clientWidth) {
        // 가로 스크롤이 필요한 경우, 추가적인 클래스나 스타일을 적용하거나 처리합니다.
        divScrollable.classList.add('scroll-needed');
    }
});