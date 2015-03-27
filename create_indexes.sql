ALTER TABLE ONLY artist ADD CONSTRAINT artist_pkey PRIMARY KEY (id);
ALTER TABLE ONLY genre ADD CONSTRAINT genre_pkey PRIMARY KEY (id);
ALTER TABLE ONLY image ADD CONSTRAINT image_pkey PRIMARY KEY (uri);
ALTER TABLE ONLY label ADD CONSTRAINT label_pkey PRIMARY KEY (id);
ALTER TABLE ONLY role ADD CONSTRAINT role_pkey PRIMARY KEY (role_name);
ALTER TABLE ONLY release ADD CONSTRAINT release_pkey PRIMARY KEY (id);
ALTER TABLE ONLY track ADD CONSTRAINT track_pkey PRIMARY KEY (track_id);
ALTER TABLE ONLY master ADD CONSTRAINT master_pkey PRIMARY KEY (id);
ALTER TABLE ONLY releases_formats ADD CONSTRAINT releases_formats_pkey PRIMARY KEY (release_id, position);
-- ALTER TABLE ONLY releases_labels ADD CONSTRAINT releases_labels_pkey PRIMARY KEY (release_id, label, catno);
ALTER TABLE ONLY releases_images ADD CONSTRAINT releases_images_pkey PRIMARY KEY (release_id, type,image_uri);
ALTER TABLE ONLY releases_artists ADD CONSTRAINT releases_artists_pkey PRIMARY KEY (release_id, position);
--ALTER TABLE ONLY releases_extraartists ADD CONSTRAINT releases_extraartists_pkey PRIMARY KEY (release_id, artist_id, artist_name, anv, role);
ALTER TABLE ONLY tracks_artists ADD CONSTRAINT tracks_artists_pkey PRIMARY KEY (track_id, position);
--ALTER TABLE ONLY tracks_extraartists ADD CONSTRAINT tracks_extraartists_pkey PRIMARY KEY (track_id, artist_id, artist_name, anv, role);
ALTER TABLE ONLY artists_images ADD CONSTRAINT artists_images_pkey PRIMARY KEY (artist_id, type,image_uri);
ALTER TABLE ONLY labels_images ADD CONSTRAINT labels_images_pkey PRIMARY KEY (label_id, type,image_uri);
ALTER TABLE ONLY masters_images ADD CONSTRAINT masters_images_pkey PRIMARY KEY (master_id, type,image_uri);
--ALTER TABLE ONLY country ADD CONSTRAINT country_pkey PRIMARY_KEY (name);
ALTER TABLE ONLY format ADD CONSTRAINT format_pkey PRIMARY KEY (name);

ALTER TABLE ONLY artists_images ADD CONSTRAINT artists_images_artist_id_fkey FOREIGN KEY (artist_id) REFERENCES artist(id);
ALTER TABLE ONLY artists_images ADD CONSTRAINT artists_images_image_uri_fkey FOREIGN KEY (image_uri) REFERENCES image(uri);
ALTER TABLE ONLY releases_labels ADD CONSTRAINT foreign_did FOREIGN KEY (release_id) REFERENCES release(id);
ALTER TABLE ONLY labels_images ADD CONSTRAINT labels_images_image_uri_fkey FOREIGN KEY (image_uri) REFERENCES image(uri);
ALTER TABLE ONLY labels_images ADD CONSTRAINT labels_images_label_id_fkey FOREIGN KEY (label_id) REFERENCES label(id);
ALTER TABLE ONLY releases_formats ADD CONSTRAINT releases_formats_release_id_fkey FOREIGN KEY (release_id) REFERENCES release(id);
ALTER TABLE ONLY releases_formats ADD CONSTRAINT releases_formats_format_name_fkey FOREIGN KEY (format_name) REFERENCES format(name);
ALTER TABLE ONLY releases_images ADD CONSTRAINT releases_images_release_id_fkey FOREIGN KEY (release_id) REFERENCES release(id);
ALTER TABLE ONLY releases_images ADD CONSTRAINT releases_images_image_uri_fkey FOREIGN KEY (image_uri) REFERENCES image(uri);
ALTER TABLE ONLY masters_images ADD CONSTRAINT masters_images_master_id_fkey FOREIGN KEY (master_id) REFERENCES master(id);
ALTER TABLE ONLY masters_images ADD CONSTRAINT masters_images_image_uri_fkey FOREIGN KEY (image_uri) REFERENCES image(uri);

CREATE INDEX release_title_idx ON release (title);
CREATE INDEX release_country_idx ON release (country);
CREATE INDEX release_barcode_idx ON release (barcode);
CREATE INDEX releases_artists_id_idx ON releases_artists (artist_id);
CREATE INDEX releases_artists_name_idx ON releases_artists (artist_name);
CREATE INDEX releases_artists_releaseid_idx ON releases_artists (release_id);
CREATE INDEX releases_extraartists_id_idx ON releases_extraartists (artist_id);
--This one record prevents index being created as of no interest to us we delete it
DELETE from releases_extraartists where release_id=4620841 and role='(Other,"Stage Sound & Light Technicians")';
CREATE INDEX releases_extraartists_name_idx ON releases_extraartists (artist_name);
CREATE INDEX releases_extraartists_releaseid_idx ON releases_extraartists (release_id);
CREATE INDEX tracks_artists_id_idx ON tracks_artists (artist_id);
CREATE INDEX tracks_artists_name_idx ON tracks_artists (artist_name);
CREATE INDEX tracks_artists_trackid_idx ON tracks_artists (track_id);
CREATE INDEX tracks_extraartists_id_idx ON tracks_extraartists (artist_id);
CREATE INDEX tracks_extraartists_name_idx ON tracks_extraartists (artist_name);
CREATE INDEX tracks_extraartists_trackid_idx ON tracks_extraartists (track_id);
CREATE INDEX track_releaseid_idx ON track (release_id);
CREATE INDEX track_releaseid_trackid ON track (release_id, track_id);
CREATE INDEX releases_labels_name_idx ON releases_labels (label);
CREATE INDEX releases_labels_catno_idx ON releases_labels (catno);
CREATE INDEX releases_formats_releaseid_idx ON releases_formats (release_id);
CREATE INDEX releases_images_releaseid_idx ON releases_images (release_id);
CREATE INDEX label_name_idx ON label (name);
CREATE INDEX artist_name_idx ON artist (name);
