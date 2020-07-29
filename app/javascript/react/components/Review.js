import React from "react";

const Review = ({ id, rating, body, user, productId }) => {
  const onChangeDelete = event => {
    event.preventDefault()
    fetch(`/api/v1/products/${productId}/reviews/${id}.json`, {
      credentials: "same-origin",
      method: 'DELETE',
      headers: {
        'Accept': 'application.json',
        'Content-Type': 'application.json',
      },
    })
  }
  return (
    <div key={id}>
      <div className="column is-one-third">
        <div className="card is-shady">
          <div className="card-content">
            <div className="content">
              <h4>
                {user} - Rating: {rating}
              </h4>
              <p>{body}</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Review;

