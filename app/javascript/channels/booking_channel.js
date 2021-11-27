import consumer from "./consumer"

const initBookingCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.bookingId;
    messagesContainer.scroll(0, document.querySelector(".messages").scrollHeight);
    consumer.subscriptions.create({ channel: "BookingChannel", id: id }, {
      received(data) {
        messagesContainer.insertAdjacentHTML("beforeend", data.messages_partial);
        messagesContainer.scroll(0, document.querySelector(".messages").scrollHeight);
      },
    });
  }
}

export { initBookingCable };
