'use strict';

/**
 * item router
 */

const { createCoreRouter } = require('@strapi/strapi').factories;


module.exports = createCoreRouter("api::item.item", {
    config: {
        find: {
            middlewares: ["api::item.item"],
        },
        findOne: {
            middlewares: ["api::item.item"],
        },
    },
});
