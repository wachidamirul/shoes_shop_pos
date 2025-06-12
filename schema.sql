-- WARNING: This schema is for context only and is not meant to be run.
-- Table order and constraints may not be valid for execution.

CREATE TABLE public.categories (
    category_id integer GENERATED ALWAYS AS IDENTITY NOT NULL UNIQUE,
    name character varying NOT NULL UNIQUE,
    is_deleted boolean NOT NULL DEFAULT false,
    CONSTRAINT categories_pkey PRIMARY KEY (category_id)
);

CREATE TABLE public.product_variants (
    variant_id integer GENERATED ALWAYS AS IDENTITY NOT NULL UNIQUE,
    product_id integer NOT NULL,
    size character varying NOT NULL,
    is_deleted boolean NOT NULL DEFAULT false,
    created_at timestamp
    with
        time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
        updated_at timestamp
    with
        time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
        CONSTRAINT product_variants_pkey PRIMARY KEY (variant_id),
        CONSTRAINT product_variants_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products (product_id)
);

CREATE TABLE public.products (
    product_id integer GENERATED ALWAYS AS IDENTITY NOT NULL UNIQUE,
    category_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    is_deleted boolean NOT NULL DEFAULT false,
    created_at timestamp
    with
        time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
        updated_at timestamp
    with
        time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
        image_url character varying NOT NULL,
        price double precision NOT NULL,
        CONSTRAINT products_pkey PRIMARY KEY (product_id),
        CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories (category_id)
);

CREATE TABLE public.stocks (
    stock_id integer GENERATED ALWAYS AS IDENTITY NOT NULL UNIQUE,
    variant_id integer NOT NULL,
    quantity integer NOT NULL DEFAULT 0,
    updated_at timestamp
    with
        time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
        CONSTRAINT stocks_pkey PRIMARY KEY (stock_id),
        CONSTRAINT stocks_variant_id_fkey FOREIGN KEY (variant_id) REFERENCES public.product_variants (variant_id)
);

CREATE TABLE public.transactions (
    transaction_id integer GENERATED ALWAYS AS IDENTITY NOT NULL UNIQUE,
    transaction_date timestamp
    with
        time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
        total_amount numeric NOT NULL,
        is_deleted boolean NOT NULL DEFAULT false,
        created_at timestamp
    with
        time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
        updated_at timestamp
    with
        time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
        CONSTRAINT transactions_pkey PRIMARY KEY (transaction_id)
);

CREATE TABLE public.transactions_details (
    transaction_detail_id integer GENERATED ALWAYS AS IDENTITY NOT NULL UNIQUE,
    transaction_id integer NOT NULL,
    variant_id integer NOT NULL,
    quantity integer NOT NULL,
    total_price numeric NOT NULL,
    created_at timestamp
    with
        time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
        CONSTRAINT transactions_details_pkey PRIMARY KEY (transaction_detail_id),
        CONSTRAINT transactions_details_transaction_id_fkey FOREIGN KEY (transaction_id) REFERENCES public.transactions (transaction_id),
        CONSTRAINT transactions_details_variant_id_fkey FOREIGN KEY (variant_id) REFERENCES public.product_variants (variant_id)
);
