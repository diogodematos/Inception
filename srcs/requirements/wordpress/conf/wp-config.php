<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** O nome do banco de dados do WordPress */
define('DB_NAME', getenv('DB_NAME'));

/** Usuário do banco de dados MySQL */
define('DB_USER', getenv('DB_USER'));

/** Senha do banco de dados MySQL */
define('DB_PASSWORD', getenv('DB_PASSWORD'));

/** Nome do host do MySQL */
define('DB_HOST', getenv('DB_HOST'));

/** Charset do banco de dados a ser usado na criação das tabelas. */
define('DB_CHARSET', 'utf8');

/** O tipo de Collate do banco de dados. Não altere isso se tiver dúvidas. */
define('DB_COLLATE', '');

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'wxW9aeykO#sU/_[$AWNs?v-L!ORn$]J1} +b#Vl<Vfo2J#i0%/&Y:q Hd*DJ}f%L');
define('SECURE_AUTH_KEY',  '7${0YCXc4?6mbcK|Md6<7<)mOVPNd[+I+.P#Vi9z:4tk5;CM2=Wz-P3P@]L5/xBH');
define('LOGGED_IN_KEY',    '?bl}~ JCz]M9^eAp0CCL|B?pI/xzkKa*/^NQ74,|4c2,y/LsKB[zpTZmBup--8I;');
define('NONCE_KEY',        'e5MsDM29d(-pFH/{Dd3NV@& r.|Buy+Wzb$-@%ziDf(wej Q8`qZ w^]Atlzh<H.');
define('AUTH_SALT',        'Ru=^$S3iTS 8rCM*7-HExJB0jYKh3Uk$Zhkd5)?r2QXAmuyL}8W`S2+rW1lZvm6;');
define('SECURE_AUTH_SALT', 'KF*`T[p9w[?4v}J4B}R:#l$RC[v#rRT5BSdag|/VF&K2!kRZ~4|~|!2c4B)fZ6iW');
define('LOGGED_IN_SALT',   '$Vp_ecZ@v<EX@*eDTaRh!z|W$T?M@z6]=Un%-3*jeO[eC8,xlp9{/ElS0B0U;y)=');
define('NONCE_SALT',       '5w9<s.co%,5l+ntNe&4k+pBYd+p0Q@0wdY><5REp$~UaQ{3kSa4zF`p$HH0Nf4Z3');


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';