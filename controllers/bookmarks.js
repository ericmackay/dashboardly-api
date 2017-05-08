const express = require('express');

const onlyLoggedIn = require('../lib/only-logged-in');

module.exports = (dataLoader) => {
  const bookmarksController = express.Router();

  // Modify a bookmark
  bookmarksController.patch('/:id', onlyLoggedIn, (req, res) => {
    dataLoader.bookmarkBelongsToUser(req.params.id, req.user.id)
    .then(() => {
      return dataLoader.updateBookmark({
        title: req.body.title,
        description: req.body.description,
        id: req.params.id,
        url: req.body.url
      });
    })
    .then(data => res.json(data))
    .catch(err => res.status(400).json(err));
    // TODO: this is up to you to implement :)
    // res.status(500).json({ error: 'not implemented' });
  });


  // Delete a bookmark
  bookmarksController.delete('/:id', onlyLoggedIn, (req, res) => {
    dataLoader.bookmarkBelongsToUser(req.params.id, req.user.id)
    .then(() => {
      return dataLoader.deleteBookmark(req.params.id);
    })
    .then(() => res.status(204).end())
    .catch(err => res.status(400).json(err));
    // IMPLEMENTED
  });

  return bookmarksController;
};
