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
        url: req.body.url
      });
    // TODO: this is up to you to implement :)
    res.status(500).json({ error: 'not implemented' });
  });


  // Delete a bookmark
  bookmarksController.delete('/:id', onlyLoggedIn, (req, res) => {
    dataLoader.bookmarkBelongsToUser(req.params.id, req.user.id)
    // TODO: this is up to you to implement :)
    res.status(500).json({ error: 'not implemented' });
  });

  return bookmarksController;
};
