<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the website, you can copy this file to "wp-config.php"
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
/** The name of the database for WordPress */
define( 'DB_NAME', 'db' );

/** Database username */
define( 'DB_USER', 'root' );

/** Database password */
define( 'DB_PASSWORD', 'mySecurePassword123' );

/** Database hostname */
define( 'DB_HOST', 'mysql' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

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
define( 'AUTH_KEY',         '_?!:M, >7he(yDV%#AEwi>U>5@%8v@Sa`6?JfrW3&F:y#TCY<Z[HZ^jI0o#xB1/+' );
define( 'SECURE_AUTH_KEY',  '7:~&o% 6rBZ}?~JH{zu7JhS,x1EYzOW5Y=l.TD+&Gq=t5#PE&TF+k{K!~;k3{z1a' );
define( 'LOGGED_IN_KEY',    '%=`qta$$*QQKm{9H56But;?b4D!Exxl>f94!s.3qsMLzJQ]*/F.VeLAHDr?eRgb0' );
define( 'NONCE_KEY',        ':?hQGl|5yDCA&wNW?xpD WP/1x-MM~d^suBuQ[n$S=E4F X=7M^nuiQ}.lZpl[.=' );
define( 'AUTH_SALT',        'WRJf`hd&V*W%=SuIu W_%gPa5!{Be{Io}yS:VC`J4,x&%2tnqcMFT<9XaiFQ&B&g' );
define( 'SECURE_AUTH_SALT', 'a%wQ~r9qUrS/N5P!2i7,y)Qd#m}r,R !o&pEl1[%etas5j*QF_dJ.Ua}x:lRf%p|' );
define( 'LOGGED_IN_SALT',   'NyP4Gt1_ dw8lG,G?5<U2}i>~kD[Of]w<1bM7(Y`W]CU?clZknEJBHaoro@`#&(Y' );
define( 'NONCE_SALT',       'g3r}{2AXhV56uh4UZ4;}:ASSU{Lfk*gP!9uomP`EsOw4zM*0eX{ OIMS)Ul[mun|' );

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
