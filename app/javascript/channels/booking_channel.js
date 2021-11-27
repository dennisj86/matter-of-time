import consumer from "./consumer"

const initBookingCable = () => {
  const messagesContainer = document.getElementById('messages');
  console.log(`chat loaded ${messagesContainer}`)
  if (messagesContainer) {
    const id = messagesContainer.dataset.bookingId;
    messagesContainer.scroll(0, document.querySelector(".messages").scrollHeight);
    consumer.subscriptions.create({ channel: "BookingChannel", id: id }, {
      received(data) {
        messagesContainer.insertAdjacentHTML("beforeend", data);
        messagesContainer.scroll(0, document.querySelector(".messages").scrollHeight);
      },
    });
  }
}

export { initBookingCable };
