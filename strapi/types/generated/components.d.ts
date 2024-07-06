import type { Schema, Attribute } from '@strapi/strapi';

export interface TagsTags extends Schema.Component {
  collectionName: 'components_tags_tags';
  info: {
    displayName: 'tags';
    icon: 'priceTag';
    description: '';
  };
  attributes: {
    color: Attribute.String;
    size: Attribute.String;
  };
}

declare module '@strapi/types' {
  export module Shared {
    export interface Components {
      'tags.tags': TagsTags;
    }
  }
}
