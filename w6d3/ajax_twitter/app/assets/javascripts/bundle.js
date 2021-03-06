/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;
/******/
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	const FollowToggle = __webpack_require__(1);
	
	$(function () {
	  $('button.follow-toggle').each( (i, btn) => new FollowToggle(btn, {}) );
	});


/***/ },
/* 1 */
/***/ function(module, exports, __webpack_require__) {

	const APIUtil = __webpack_require__(2);
	
	class FollowToggle {
	  constructor(el, options) {
	    this.$el = $(el);
	    this.userId = this.$el.data('user-id') || options.userId;
	    this.followState = (this.$el.data('initial-follow-state') || options.followState);
	
	    this.render();
	
	    this.$el.on('click', this.handleClick.bind(this));
	  }
	
	  handleClick(event) {
	    const followToggle = this;
	
	    event.preventDefault();
	
	
	    if (this.followState === 'followed') {
	      this.followState = 'unfollowing';
	      this.render();
	      APIUtil.unfollowUser(this.userId).then(() => {
	        followToggle.followState = 'unfollowed';
	        followToggle.render();
	      });
	    } else if (this.followState === 'unfollowed') {
	      this.followState = 'following';
	      this.render();
	      APIUtil.followUser(this.userId).then(() => {
	        followToggle.followState = 'followed';
	        followToggle.render();
	      });
	    }
	  }
	
	  render() {
	    switch (this.followState) {
	      case 'followed':
	        this.$el.prop('disabled', false);
	        this.$el.html('Unfollow!');
	        break;
	      case 'unfollowed':
	        this.$el.prop('disabled', false);
	        this.$el.html('Follow!');
	        break;
	      case 'following':
	        this.$el.prop('disabled', true);
	        this.$el.html('Following...');
	        break;
	      case 'unfollowing':
	        this.$el.prop('disabled', true);
	        this.$el.html('Unfollowing...');
	        break;
	    }
	  }
	}
	
	
	module.exports = FollowToggle;


/***/ },
/* 2 */
/***/ function(module, exports) {

	const APIUtil = {
	
	  followUser: id => APIUtil.changeFollowStatus(id, 'POST'),
	
	  unfollowUser: id => APIUtil.changeFollowStatus(id, 'DELETE'),
	
	  changeFollowStatus: (id, method) => (
	    $.ajax({
	      url: `/users/${id}/follow`,
	      dataType: 'json',
	      method
	    })
	  ),
	};
	
	module.exports = APIUtil;


/***/ }
/******/ ]);
//# sourceMappingURL=bundle.js.map