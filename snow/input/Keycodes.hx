package snow.input;


/** The keycode class, with conversion helpers for scancodes. The values below come directly from SDL header include files,
but they aren't specific to SDL so they are used generically */
@:noCompletion class Keycodes {

        /** Convert a scancode to a keycode for comparison */
    public static function from_scan( scancode : Int ) : Int {
        return (scancode | (1<<30));
    } //from_scan

        /** Convert a keycode to string */
    public static function name( keycode : Int ) : String {
        if ((keycode & (1<<30)) != 0)
            return Scancodes.name(keycode &~ (1<<30));

        switch(keycode) {
            case Keycodes.RETURN:    return Scancodes.name(Scancodes.RETURN);
            case Keycodes.ESCAPE:    return Scancodes.name(Scancodes.ESCAPE);
            case Keycodes.BACKSPACE: return Scancodes.name(Scancodes.BACKSPACE);
            case Keycodes.TAB:       return Scancodes.name(Scancodes.TAB);
            case Keycodes.SPACE:     return Scancodes.name(Scancodes.SPACE);
            case Keycodes.DELETE:    return Scancodes.name(Scancodes.DELETE);
            default:
                var decoder = new haxe.Utf8();
                decoder.addChar(keycode);
                return decoder.toString();
        }
    } //name    

    public static var UNKNOWN : Int                     = 0;

    public static var RETURN : Int                      = 13;
    public static var ESCAPE : Int                      = 27;
    public static var BACKSPACE : Int                   = 8;
    public static var TAB : Int                         = 9;
    public static var SPACE : Int                       = 32;
    public static var EXCLAIM : Int                     = 33;
    public static var QUOTEDBL : Int                    = 34;
    public static var HASH : Int                        = 35;
    public static var PERCENT : Int                     = 37;
    public static var DOLLAR : Int                      = 36;
    public static var AMPERSAND : Int                   = 38;
    public static var QUOTE : Int                       = 39;
    public static var LEFTPAREN : Int                   = 40;
    public static var RIGHTPAREN : Int                  = 41;
    public static var ASTERISK : Int                    = 42;
    public static var PLUS : Int                        = 43;
    public static var COMMA : Int                       = 44;
    public static var MINUS : Int                       = 45;
    public static var PERIOD : Int                      = 46;
    public static var SLASH : Int                       = 47;
    public static var KEY_0 : Int                       = 48;
    public static var KEY_1 : Int                       = 49;
    public static var KEY_2 : Int                       = 50;
    public static var KEY_3 : Int                       = 51;
    public static var KEY_4 : Int                       = 52;
    public static var KEY_5 : Int                       = 53;
    public static var KEY_6 : Int                       = 54;
    public static var KEY_7 : Int                       = 55;
    public static var KEY_8 : Int                       = 56;
    public static var KEY_9 : Int                       = 57;
    public static var COLON : Int                       = 58;
    public static var SEMICOLON : Int                   = 59;
    public static var LESS : Int                        = 60;
    public static var EQUALS : Int                      = 61;
    public static var GREATER : Int                     = 62;
    public static var QUESTION : Int                    = 63;
    public static var AT : Int                          = 64;
    /*
       Skip uppercase letters
     */
    public static var LEFTBRACKET : Int                 = 91;
    public static var BACKSLASH : Int                   = 92;
    public static var RIGHTBRACKET : Int                = 93;
    public static var CARET : Int                       = 94;
    public static var UNDERSCORE : Int                  = 95;
    public static var BACKQUOTE : Int                   = 96;
    public static var KEY_a : Int                       = 97;
    public static var KEY_b : Int                       = 98;
    public static var KEY_c : Int                       = 99;
    public static var KEY_d : Int                       = 100;
    public static var KEY_e : Int                       = 101;
    public static var KEY_f : Int                       = 102;
    public static var KEY_g : Int                       = 103;
    public static var KEY_h : Int                       = 104;
    public static var KEY_i : Int                       = 105;
    public static var KEY_j : Int                       = 106;
    public static var KEY_k : Int                       = 107;
    public static var KEY_l : Int                       = 108;
    public static var KEY_m : Int                       = 109;
    public static var KEY_n : Int                       = 110;
    public static var KEY_o : Int                       = 111;
    public static var KEY_p : Int                       = 112;
    public static var KEY_q : Int                       = 113;
    public static var KEY_r : Int                       = 114;
    public static var KEY_s : Int                       = 115;
    public static var KEY_t : Int                       = 116;
    public static var KEY_u : Int                       = 117;
    public static var KEY_v : Int                       = 118;
    public static var KEY_w : Int                       = 119;
    public static var KEY_x : Int                       = 120;
    public static var KEY_y : Int                       = 121;
    public static var KEY_z : Int                       = 122;

    public static var CAPSLOCK : Int             = from_scan(Scancodes.CAPSLOCK);

    public static var F1 : Int                   = from_scan(Scancodes.F1);
    public static var F2 : Int                   = from_scan(Scancodes.F2);
    public static var F3 : Int                   = from_scan(Scancodes.F3);
    public static var F4 : Int                   = from_scan(Scancodes.F4);
    public static var F5 : Int                   = from_scan(Scancodes.F5);
    public static var F6 : Int                   = from_scan(Scancodes.F6);
    public static var F7 : Int                   = from_scan(Scancodes.F7);
    public static var F8 : Int                   = from_scan(Scancodes.F8);
    public static var F9 : Int                   = from_scan(Scancodes.F9);
    public static var F10 : Int                  = from_scan(Scancodes.F10);
    public static var F11 : Int                  = from_scan(Scancodes.F11);
    public static var F12 : Int                  = from_scan(Scancodes.F12);

    public static var PRINTSCREEN : Int          = from_scan(Scancodes.PRINTSCREEN);
    public static var SCROLLLOCK : Int           = from_scan(Scancodes.SCROLLLOCK);
    public static var PAUSE : Int                = from_scan(Scancodes.PAUSE);
    public static var INSERT : Int               = from_scan(Scancodes.INSERT);
    public static var HOME : Int                 = from_scan(Scancodes.HOME);
    public static var PAGEUP : Int               = from_scan(Scancodes.PAGEUP);
    public static var DELETE : Int               = 127;
    public static var END : Int                  = from_scan(Scancodes.END);
    public static var PAGEDOWN : Int             = from_scan(Scancodes.PAGEDOWN);
    public static var RIGHT : Int                = from_scan(Scancodes.RIGHT);
    public static var LEFT : Int                 = from_scan(Scancodes.LEFT);
    public static var DOWN : Int                 = from_scan(Scancodes.DOWN);
    public static var UP : Int                   = from_scan(Scancodes.UP);

    public static var NUMLOCKCLEAR : Int         = from_scan(Scancodes.NUMLOCKCLEAR);
    public static var KP_DIVIDE : Int            = from_scan(Scancodes.KP_DIVIDE);
    public static var KP_MULTIPLY : Int          = from_scan(Scancodes.KP_MULTIPLY);
    public static var KP_MINUS : Int             = from_scan(Scancodes.KP_MINUS);
    public static var KP_PLUS : Int              = from_scan(Scancodes.KP_PLUS);
    public static var KP_ENTER : Int             = from_scan(Scancodes.KP_ENTER);
    public static var KP_1 : Int                 = from_scan(Scancodes.KP_1);
    public static var KP_2 : Int                 = from_scan(Scancodes.KP_2);
    public static var KP_3 : Int                 = from_scan(Scancodes.KP_3);
    public static var KP_4 : Int                 = from_scan(Scancodes.KP_4);
    public static var KP_5 : Int                 = from_scan(Scancodes.KP_5);
    public static var KP_6 : Int                 = from_scan(Scancodes.KP_6);
    public static var KP_7 : Int                 = from_scan(Scancodes.KP_7);
    public static var KP_8 : Int                 = from_scan(Scancodes.KP_8);
    public static var KP_9 : Int                 = from_scan(Scancodes.KP_9);
    public static var KP_0 : Int                 = from_scan(Scancodes.KP_0);
    public static var KP_PERIOD : Int            = from_scan(Scancodes.KP_PERIOD);

    public static var APPLICATION : Int          = from_scan(Scancodes.APPLICATION);
    public static var POWER : Int                = from_scan(Scancodes.POWER);
    public static var KP_EQUALS : Int            = from_scan(Scancodes.KP_EQUALS);
    public static var F13 : Int                  = from_scan(Scancodes.F13);
    public static var F14 : Int                  = from_scan(Scancodes.F14);
    public static var F15 : Int                  = from_scan(Scancodes.F15);
    public static var F16 : Int                  = from_scan(Scancodes.F16);
    public static var F17 : Int                  = from_scan(Scancodes.F17);
    public static var F18 : Int                  = from_scan(Scancodes.F18);
    public static var F19 : Int                  = from_scan(Scancodes.F19);
    public static var F20 : Int                  = from_scan(Scancodes.F20);
    public static var F21 : Int                  = from_scan(Scancodes.F21);
    public static var F22 : Int                  = from_scan(Scancodes.F22);
    public static var F23 : Int                  = from_scan(Scancodes.F23);
    public static var F24 : Int                  = from_scan(Scancodes.F24);
    public static var EXECUTE : Int              = from_scan(Scancodes.EXECUTE);
    public static var HELP : Int                 = from_scan(Scancodes.HELP);
    public static var MENU : Int                 = from_scan(Scancodes.MENU);
    public static var SELECT : Int               = from_scan(Scancodes.SELECT);
    public static var STOP : Int                 = from_scan(Scancodes.STOP);
    public static var AGAIN : Int                = from_scan(Scancodes.AGAIN);
    public static var UNDO : Int                 = from_scan(Scancodes.UNDO);
    public static var CUT : Int                  = from_scan(Scancodes.CUT);
    public static var COPY : Int                 = from_scan(Scancodes.COPY);
    public static var PASTE : Int                = from_scan(Scancodes.PASTE);
    public static var FIND : Int                 = from_scan(Scancodes.FIND);
    public static var MUTE : Int                 = from_scan(Scancodes.MUTE);
    public static var VOLUMEUP : Int             = from_scan(Scancodes.VOLUMEUP);
    public static var VOLUMEDOWN : Int           = from_scan(Scancodes.VOLUMEDOWN);
    public static var KP_COMMA : Int             = from_scan(Scancodes.KP_COMMA);
    public static var KP_EQUALSAS400 : Int       = from_scan(Scancodes.KP_EQUALSAS400);

    public static var ALTERASE : Int             = from_scan(Scancodes.ALTERASE);
    public static var SYSREQ : Int               = from_scan(Scancodes.SYSREQ);
    public static var CANCEL : Int               = from_scan(Scancodes.CANCEL);
    public static var CLEAR : Int                = from_scan(Scancodes.CLEAR);
    public static var PRIOR : Int                = from_scan(Scancodes.PRIOR);
    public static var RETURN2 : Int              = from_scan(Scancodes.RETURN2);
    public static var SEPARATOR : Int            = from_scan(Scancodes.SEPARATOR);
    public static var OUT : Int                  = from_scan(Scancodes.OUT);
    public static var OPER : Int                 = from_scan(Scancodes.OPER);
    public static var CLEARAGAIN : Int           = from_scan(Scancodes.CLEARAGAIN);
    public static var CRSEL : Int                = from_scan(Scancodes.CRSEL);
    public static var EXSEL : Int                = from_scan(Scancodes.EXSEL);

    public static var KP_00 : Int                = from_scan(Scancodes.KP_00);
    public static var KP_000 : Int               = from_scan(Scancodes.KP_000);
    public static var THOUSANDSSEPARATOR : Int   = from_scan(Scancodes.THOUSANDSSEPARATOR);
    public static var DECIMALSEPARATOR : Int     = from_scan(Scancodes.DECIMALSEPARATOR);
    public static var CURRENCYUNIT : Int         = from_scan(Scancodes.CURRENCYUNIT);
    public static var CURRENCYSUBUNIT : Int      = from_scan(Scancodes.CURRENCYSUBUNIT);
    public static var KP_LEFTPAREN : Int         = from_scan(Scancodes.KP_LEFTPAREN);
    public static var KP_RIGHTPAREN : Int        = from_scan(Scancodes.KP_RIGHTPAREN);
    public static var KP_LEFTBRACE : Int         = from_scan(Scancodes.KP_LEFTBRACE);
    public static var KP_RIGHTBRACE : Int        = from_scan(Scancodes.KP_RIGHTBRACE);
    public static var KP_TAB : Int               = from_scan(Scancodes.KP_TAB);
    public static var KP_BACKSPACE : Int         = from_scan(Scancodes.KP_BACKSPACE);
    public static var KP_A : Int                 = from_scan(Scancodes.KP_A);
    public static var KP_B : Int                 = from_scan(Scancodes.KP_B);
    public static var KP_C : Int                 = from_scan(Scancodes.KP_C);
    public static var KP_D : Int                 = from_scan(Scancodes.KP_D);
    public static var KP_E : Int                 = from_scan(Scancodes.KP_E);
    public static var KP_F : Int                 = from_scan(Scancodes.KP_F);
    public static var KP_XOR : Int               = from_scan(Scancodes.KP_XOR);
    public static var KP_POWER : Int             = from_scan(Scancodes.KP_POWER);
    public static var KP_PERCENT : Int           = from_scan(Scancodes.KP_PERCENT);
    public static var KP_LESS : Int              = from_scan(Scancodes.KP_LESS);
    public static var KP_GREATER : Int           = from_scan(Scancodes.KP_GREATER);
    public static var KP_AMPERSAND : Int         = from_scan(Scancodes.KP_AMPERSAND);
    public static var KP_DBLAMPERSAND : Int      = from_scan(Scancodes.KP_DBLAMPERSAND);
    public static var KP_VERTICALBAR : Int       = from_scan(Scancodes.KP_VERTICALBAR);
    public static var KP_DBLVERTICALBAR : Int    = from_scan(Scancodes.KP_DBLVERTICALBAR);
    public static var KP_COLON : Int             = from_scan(Scancodes.KP_COLON);
    public static var KP_HASH : Int              = from_scan(Scancodes.KP_HASH);
    public static var KP_SPACE : Int             = from_scan(Scancodes.KP_SPACE);
    public static var KP_AT : Int                = from_scan(Scancodes.KP_AT);
    public static var KP_EXCLAM : Int            = from_scan(Scancodes.KP_EXCLAM);
    public static var KP_MEMSTORE : Int          = from_scan(Scancodes.KP_MEMSTORE);
    public static var KP_MEMRECALL : Int         = from_scan(Scancodes.KP_MEMRECALL);
    public static var KP_MEMCLEAR : Int          = from_scan(Scancodes.KP_MEMCLEAR);
    public static var KP_MEMADD : Int            = from_scan(Scancodes.KP_MEMADD);
    public static var KP_MEMSUBTRACT : Int       = from_scan(Scancodes.KP_MEMSUBTRACT);
    public static var KP_MEMMULTIPLY : Int       = from_scan(Scancodes.KP_MEMMULTIPLY);
    public static var KP_MEMDIVIDE : Int         = from_scan(Scancodes.KP_MEMDIVIDE);
    public static var KP_PLUSMINUS : Int         = from_scan(Scancodes.KP_PLUSMINUS);
    public static var KP_CLEAR : Int             = from_scan(Scancodes.KP_CLEAR);
    public static var KP_CLEARENTRY : Int        = from_scan(Scancodes.KP_CLEARENTRY);
    public static var KP_BINARY : Int            = from_scan(Scancodes.KP_BINARY);
    public static var KP_OCTAL : Int             = from_scan(Scancodes.KP_OCTAL);
    public static var KP_DECIMAL : Int           = from_scan(Scancodes.KP_DECIMAL);
    public static var KP_HEXADECIMAL : Int       = from_scan(Scancodes.KP_HEXADECIMAL);

    public static var LCTRL : Int                = from_scan(Scancodes.LCTRL);
    public static var LSHIFT : Int               = from_scan(Scancodes.LSHIFT);
    public static var LALT : Int                 = from_scan(Scancodes.LALT);
    public static var LMETA : Int                = from_scan(Scancodes.LMETA);
    public static var RCTRL : Int                = from_scan(Scancodes.RCTRL);
    public static var RSHIFT : Int               = from_scan(Scancodes.RSHIFT);
    public static var RALT : Int                 = from_scan(Scancodes.RALT);
    public static var RMETA : Int                = from_scan(Scancodes.RMETA);

    public static var MODE : Int                 = from_scan(Scancodes.MODE);

    public static var AUDIONEXT : Int            = from_scan(Scancodes.AUDIONEXT);
    public static var AUDIOPREV : Int            = from_scan(Scancodes.AUDIOPREV);
    public static var AUDIOSTOP : Int            = from_scan(Scancodes.AUDIOSTOP);
    public static var AUDIOPLAY : Int            = from_scan(Scancodes.AUDIOPLAY);
    public static var AUDIOMUTE : Int            = from_scan(Scancodes.AUDIOMUTE);
    public static var MEDIASELECT : Int          = from_scan(Scancodes.MEDIASELECT);
    public static var WWW : Int                  = from_scan(Scancodes.WWW);
    public static var MAIL : Int                 = from_scan(Scancodes.MAIL);
    public static var CALCULATOR : Int           = from_scan(Scancodes.CALCULATOR);
    public static var COMPUTER : Int             = from_scan(Scancodes.COMPUTER);
    public static var AC_SEARCH : Int            = from_scan(Scancodes.AC_SEARCH);
    public static var AC_HOME : Int              = from_scan(Scancodes.AC_HOME);
    public static var AC_BACK : Int              = from_scan(Scancodes.AC_BACK);
    public static var AC_FORWARD : Int           = from_scan(Scancodes.AC_FORWARD);
    public static var AC_STOP : Int              = from_scan(Scancodes.AC_STOP);
    public static var AC_REFRESH : Int           = from_scan(Scancodes.AC_REFRESH);
    public static var AC_BOOKMARKS : Int         = from_scan(Scancodes.AC_BOOKMARKS);

    public static var BRIGHTNESSDOWN : Int       = from_scan(Scancodes.BRIGHTNESSDOWN);
    public static var BRIGHTNESSUP : Int         = from_scan(Scancodes.BRIGHTNESSUP);
    public static var DISPLAYSWITCH : Int        = from_scan(Scancodes.DISPLAYSWITCH);
    public static var KBDILLUMTOGGLE : Int       = from_scan(Scancodes.KBDILLUMTOGGLE);
    public static var KBDILLUMDOWN : Int         = from_scan(Scancodes.KBDILLUMDOWN);
    public static var KBDILLUMUP : Int           = from_scan(Scancodes.KBDILLUMUP);
    public static var EJECT : Int                = from_scan(Scancodes.EJECT);
    public static var SLEEP : Int                = from_scan(Scancodes.SLEEP);

} //Keycodes


/** The scancode class. The values below come directly from SDL header include files,
but they aren't specific to SDL so they are used generically */
@:noCompletion class Scancodes {

    public static var UNKNOWN : Int                 = 0;

       // Usage page 0x07
       // These values are from usage page 0x07 (USB keyboard page).

    public static var KEY_A : Int                   = 4;
    public static var KEY_B : Int                   = 5;
    public static var KEY_C : Int                   = 6;
    public static var KEY_D : Int                   = 7;
    public static var KEY_E : Int                   = 8;
    public static var KEY_F : Int                   = 9;
    public static var KEY_G : Int                   = 10;
    public static var KEY_H : Int                   = 11;
    public static var KEY_I : Int                   = 12;
    public static var KEY_J : Int                   = 13;
    public static var KEY_K : Int                   = 14;
    public static var KEY_L : Int                   = 15;
    public static var KEY_M : Int                   = 16;
    public static var KEY_N : Int                   = 17;
    public static var KEY_O : Int                   = 18;
    public static var KEY_P : Int                   = 19;
    public static var KEY_Q : Int                   = 20;
    public static var KEY_R : Int                   = 21;
    public static var KEY_S : Int                   = 22;
    public static var KEY_T : Int                   = 23;
    public static var KEY_U : Int                   = 24;
    public static var KEY_V : Int                   = 25;
    public static var KEY_W : Int                   = 26;
    public static var KEY_X : Int                   = 27;
    public static var KEY_Y : Int                   = 28;
    public static var KEY_Z : Int                   = 29;

    public static var KEY_1 : Int                   = 30;
    public static var KEY_2 : Int                   = 31;
    public static var KEY_3 : Int                   = 32;
    public static var KEY_4 : Int                   = 33;
    public static var KEY_5 : Int                   = 34;
    public static var KEY_6 : Int                   = 35;
    public static var KEY_7 : Int                   = 36;
    public static var KEY_8 : Int                   = 37;
    public static var KEY_9 : Int                   = 38;
    public static var KEY_0 : Int                   = 39;

    public static var RETURN : Int                  = 40;
    public static var ESCAPE : Int                  = 41;
    public static var BACKSPACE : Int               = 42;
    public static var TAB : Int                     = 43;
    public static var SPACE : Int                   = 44;

    public static var MINUS : Int                   = 45;
    public static var EQUALS : Int                  = 46;
    public static var LEFTBRACKET : Int             = 47;
    public static var RIGHTBRACKET : Int            = 48;

/** Located at the lower left of the return
    key on ISO keyboards and at the right end
    of the QWERTY row on ANSI keyboards.
    Produces REVERSE SOLIDUS (backslash) and
    VERTICAL LINE in a US layout, REVERSE
    SOLIDUS and VERTICAL LINE in a UK Mac
    layout, NUMBER SIGN and TILDE in a UK
    Windows layout, DOLLAR SIGN and POUND SIGN
    in a Swiss German layout, NUMBER SIGN and
    APOSTROPHE in a German layout, GRAVE
    ACCENT and POUND SIGN in a French Mac
    layout, and ASTERISK and MICRO SIGN in a
    French Windows layout.
*/
    public static var BACKSLASH : Int               = 49;

/** ISO USB keyboards actually use this code
    instead of 49 for the same key, but all
    OSes I've seen treat the two codes
    identically. So, as an implementor, unless
    your keyboard generates both of those
    codes and your OS treats them differently,
    you should generate public static var BACKSLASH
    instead of this code. As a user, you
    should not rely on this code because SDL
    will never generate it with most (all?)
    keyboards.
*/
    public static var NONUSHASH : Int          = 50;
    public static var SEMICOLON : Int          = 51;
    public static var APOSTROPHE : Int         = 52;

/** Located in the top left corner (on both ANSI
    and ISO keyboards). Produces GRAVE ACCENT and
    TILDE in a US Windows layout and in US and UK
    Mac layouts on ANSI keyboards, GRAVE ACCENT
    and NOT SIGN in a UK Windows layout, SECTION
    SIGN and PLUS-MINUS SIGN in US and UK Mac
    layouts on ISO keyboards, SECTION SIGN and
    DEGREE SIGN in a Swiss German layout (Mac:
    only on ISO keyboards); CIRCUMFLEX ACCENT and
    DEGREE SIGN in a German layout (Mac: only on
    ISO keyboards), SUPERSCRIPT TWO and TILDE in a
    French Windows layout, COMMERCIAL AT and
    NUMBER SIGN in a French Mac layout on ISO
    keyboards, and LESS-THAN SIGN and GREATER-THAN
    SIGN in a Swiss German, German, or French Mac
    layout on ANSI keyboards.
*/
    public static var GRAVE : Int              = 53;
    public static var COMMA : Int              = 54;
    public static var PERIOD : Int             = 55;
    public static var SLASH : Int              = 56;

    public static var CAPSLOCK : Int           = 57;

    public static var F1 : Int                 = 58;
    public static var F2 : Int                 = 59;
    public static var F3 : Int                 = 60;
    public static var F4 : Int                 = 61;
    public static var F5 : Int                 = 62;
    public static var F6 : Int                 = 63;
    public static var F7 : Int                 = 64;
    public static var F8 : Int                 = 65;
    public static var F9 : Int                 = 66;
    public static var F10 : Int                = 67;
    public static var F11 : Int                = 68;
    public static var F12 : Int                = 69;

    public static var PRINTSCREEN : Int        = 70;
    public static var SCROLLLOCK : Int         = 71;
    public static var PAUSE : Int              = 72;

/** insert on PC, help on some Mac keyboards (but does send code 73, not 117) */
    public static var INSERT : Int             = 73;
    public static var HOME : Int               = 74;
    public static var PAGEUP : Int             = 75;
    public static var DELETE : Int             = 76;
    public static var END : Int                = 77;
    public static var PAGEDOWN : Int           = 78;
    public static var RIGHT : Int              = 79;
    public static var LEFT : Int               = 80;
    public static var DOWN : Int               = 81;
    public static var UP : Int                 = 82;

/** num lock on PC, clear on Mac keyboards */
    public static var NUMLOCKCLEAR : Int       = 83;
    public static var KP_DIVIDE : Int          = 84;
    public static var KP_MULTIPLY : Int        = 85;
    public static var KP_MINUS : Int           = 86;
    public static var KP_PLUS : Int            = 87;
    public static var KP_ENTER : Int           = 88;
    public static var KP_1 : Int               = 89;
    public static var KP_2 : Int               = 90;
    public static var KP_3 : Int               = 91;
    public static var KP_4 : Int               = 92;
    public static var KP_5 : Int               = 93;
    public static var KP_6 : Int               = 94;
    public static var KP_7 : Int               = 95;
    public static var KP_8 : Int               = 96;
    public static var KP_9 : Int               = 97;
    public static var KP_0 : Int               = 98;
    public static var KP_PERIOD : Int          = 99;


/** This is the additional key that ISO
    keyboards have over ANSI ones,
    located between left shift and Y.
    Produces GRAVE ACCENT and TILDE in a
    US or UK Mac layout, REVERSE SOLIDUS
    (backslash) and VERTICAL LINE in a
    US or UK Windows layout, and
    LESS-THAN SIGN and GREATER-THAN SIGN
    in a Swiss German, German, or French
    layout. */
    public static var NONUSBACKSLASH : Int     = 100;

/** windows contextual menu, compose */
    public static var APPLICATION : Int        = 101;

/** The USB document says this is a status flag,
    not a physical key - but some Mac keyboards
    do have a power key. */
    public static var POWER : Int              = 102;
    public static var KP_EQUALS : Int          = 103;
    public static var F13 : Int                = 104;
    public static var F14 : Int                = 105;
    public static var F15 : Int                = 106;
    public static var F16 : Int                = 107;
    public static var F17 : Int                = 108;
    public static var F18 : Int                = 109;
    public static var F19 : Int                = 110;
    public static var F20 : Int                = 111;
    public static var F21 : Int                = 112;
    public static var F22 : Int                = 113;
    public static var F23 : Int                = 114;
    public static var F24 : Int                = 115;
    public static var EXECUTE : Int            = 116;
    public static var HELP : Int               = 117;
    public static var MENU : Int               = 118;
    public static var SELECT : Int             = 119;
    public static var STOP : Int               = 120;

/** redo */
    public static var AGAIN : Int              = 121;
    public static var UNDO : Int               = 122;
    public static var CUT : Int                = 123;
    public static var COPY : Int               = 124;
    public static var PASTE : Int              = 125;
    public static var FIND : Int               = 126;
    public static var MUTE : Int               = 127;
    public static var VOLUMEUP : Int           = 128;
    public static var VOLUMEDOWN : Int         = 129;

// not sure whether there's a reason to enable these
//     public static var LOCKINGCAPSLOCK = 130,
//     public static var LOCKINGNUMLOCK = 131,
//     public static var LOCKINGSCROLLLOCK = 132,

    public static var KP_COMMA : Int           = 133;
    public static var KP_EQUALSAS400 : Int     = 134;

/** used on Asian keyboards; see footnotes in USB doc */
    public static var INTERNATIONAL1 : Int     = 135;
    public static var INTERNATIONAL2 : Int     = 136;

/** Yen */
    public static var INTERNATIONAL3 : Int     = 137;
    public static var INTERNATIONAL4 : Int     = 138;
    public static var INTERNATIONAL5 : Int     = 139;
    public static var INTERNATIONAL6 : Int     = 140;
    public static var INTERNATIONAL7 : Int     = 141;
    public static var INTERNATIONAL8 : Int     = 142;
    public static var INTERNATIONAL9 : Int     = 143;
/** Hangul/English toggle */
    public static var LANG1 : Int              = 144;
/** Hanja conversion */
    public static var LANG2 : Int              = 145;
/** Katakana */
    public static var LANG3 : Int              = 146;
/** Hiragana */
    public static var LANG4 : Int              = 147;
/** Zenkaku/Hankaku */
    public static var LANG5 : Int              = 148;
/** reserved */
    public static var LANG6 : Int              = 149;
/** reserved */
    public static var LANG7 : Int              = 150;
/** reserved */
    public static var LANG8 : Int              = 151;
/** reserved */
    public static var LANG9 : Int              = 152;
/** Erase-Eaze */
    public static var ALTERASE : Int           = 153;
    public static var SYSREQ : Int             = 154;
    public static var CANCEL : Int             = 155;
    public static var CLEAR : Int              = 156;
    public static var PRIOR : Int              = 157;
    public static var RETURN2 : Int            = 158;
    public static var SEPARATOR : Int          = 159;
    public static var OUT : Int                = 160;
    public static var OPER : Int               = 161;
    public static var CLEARAGAIN : Int         = 162;
    public static var CRSEL : Int              = 163;
    public static var EXSEL : Int              = 164;

    public static var KP_00 : Int              = 176;
    public static var KP_000 : Int             = 177;
    public static var THOUSANDSSEPARATOR : Int = 178;
    public static var DECIMALSEPARATOR : Int   = 179;
    public static var CURRENCYUNIT : Int       = 180;
    public static var CURRENCYSUBUNIT : Int    = 181;
    public static var KP_LEFTPAREN : Int       = 182;
    public static var KP_RIGHTPAREN : Int      = 183;
    public static var KP_LEFTBRACE : Int       = 184;
    public static var KP_RIGHTBRACE : Int      = 185;
    public static var KP_TAB : Int             = 186;
    public static var KP_BACKSPACE : Int       = 187;
    public static var KP_A : Int               = 188;
    public static var KP_B : Int               = 189;
    public static var KP_C : Int               = 190;
    public static var KP_D : Int               = 191;
    public static var KP_E : Int               = 192;
    public static var KP_F : Int               = 193;
    public static var KP_XOR : Int             = 194;
    public static var KP_POWER : Int           = 195;
    public static var KP_PERCENT : Int         = 196;
    public static var KP_LESS : Int            = 197;
    public static var KP_GREATER : Int         = 198;
    public static var KP_AMPERSAND : Int       = 199;
    public static var KP_DBLAMPERSAND : Int    = 200;
    public static var KP_VERTICALBAR : Int     = 201;
    public static var KP_DBLVERTICALBAR : Int  = 202;
    public static var KP_COLON : Int           = 203;
    public static var KP_HASH : Int            = 204;
    public static var KP_SPACE : Int           = 205;
    public static var KP_AT : Int              = 206;
    public static var KP_EXCLAM : Int          = 207;
    public static var KP_MEMSTORE : Int        = 208;
    public static var KP_MEMRECALL : Int       = 209;
    public static var KP_MEMCLEAR : Int        = 210;
    public static var KP_MEMADD : Int          = 211;
    public static var KP_MEMSUBTRACT : Int     = 212;
    public static var KP_MEMMULTIPLY : Int     = 213;
    public static var KP_MEMDIVIDE : Int       = 214;
    public static var KP_PLUSMINUS : Int       = 215;
    public static var KP_CLEAR : Int           = 216;
    public static var KP_CLEARENTRY : Int      = 217;
    public static var KP_BINARY : Int          = 218;
    public static var KP_OCTAL : Int           = 219;
    public static var KP_DECIMAL : Int         = 220;
    public static var KP_HEXADECIMAL : Int     = 221;

    public static var LCTRL : Int              = 224;
    public static var LSHIFT : Int             = 225;
/** alt, option */
    public static var LALT : Int               = 226;
/** windows, command (apple), meta */
    public static var LMETA : Int              = 227;
    public static var RCTRL : Int              = 228;
    public static var RSHIFT : Int             = 229;
/** alt gr, option */
    public static var RALT : Int               = 230;
/** windows, command (apple), meta */
    public static var RMETA : Int              = 231;

/** Not sure if this is really not covered
    by any of the above, but since there's a
    special KMOD_MODE for it I'm adding it here */
    public static var MODE : Int               = 257;


    //
    //    Usage page 0x0C
    //    These values are mapped from usage page 0x0C (USB consumer page).

    public static var AUDIONEXT : Int          = 258;
    public static var AUDIOPREV : Int          = 259;
    public static var AUDIOSTOP : Int          = 260;
    public static var AUDIOPLAY : Int          = 261;
    public static var AUDIOMUTE : Int          = 262;
    public static var MEDIASELECT : Int        = 263;
    public static var WWW : Int                = 264;
    public static var MAIL : Int               = 265;
    public static var CALCULATOR : Int         = 266;
    public static var COMPUTER : Int           = 267;
    public static var AC_SEARCH : Int          = 268;
    public static var AC_HOME : Int            = 269;
    public static var AC_BACK : Int            = 270;
    public static var AC_FORWARD : Int         = 271;
    public static var AC_STOP : Int            = 272;
    public static var AC_REFRESH : Int         = 273;
    public static var AC_BOOKMARKS : Int       = 274;

      // Walther keys
      // These are values that Christian Walther added (for mac keyboard?).

    public static var BRIGHTNESSDOWN : Int     = 275;
    public static var BRIGHTNESSUP : Int       = 276;

/** display mirroring/dual display switch, video mode switch */
    public static var DISPLAYSWITCH : Int      = 277;

    public static var KBDILLUMTOGGLE : Int     = 278;
    public static var KBDILLUMDOWN : Int       = 279;
    public static var KBDILLUMUP : Int         = 280;
    public static var EJECT : Int              = 281;
    public static var SLEEP : Int              = 282;

    public static var APP1 : Int               = 283;
    public static var APP2 : Int               = 284;

/** Convert a scancode to a name */
    public static function name( scancode : Int ) : String {
        var res = null;
        if (scancode>=0 && scancode < scancode_names.length) {
            res = scancode_names[scancode];
        }        
        return res != null ? res : "";
    } //name

    static var scancode_names:Array<String> = [
        null, null, null, null,
        "A",
        "B",
        "C",
        "D",
        "E",
        "F",
        "G",
        "H",
        "I",
        "J",
        "K",
        "L",
        "M",
        "N",
        "O",
        "P",
        "Q",
        "R",
        "S",
        "T",
        "U",
        "V",
        "W",
        "X",
        "Y",
        "Z",
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8",
        "9",
        "0",
        "Return",
        "Escape",
        "Backspace",
        "Tab",
        "Space",
        "-",
        "=",
        "[",
        "]",
        "\\",
        "#",
        ";",
        "'",
        "`",
        ",",
        ".",
        "/",
        "CapsLock",
        "F1",
        "F2",
        "F3",
        "F4",
        "F5",
        "F6",
        "F7",
        "F8",
        "F9",
        "F10",
        "F11",
        "F12",
        "PrintScreen",
        "ScrollLock",
        "Pause",
        "Insert",
        "Home",
        "PageUp",
        "Delete",
        "End",
        "PageDown",
        "Right",
        "Left",
        "Down",
        "Up",
        "Numlock",
        "Keypad /",
        "Keypad *",
        "Keypad -",
        "Keypad +",
        "Keypad Enter",
        "Keypad 1",
        "Keypad 2",
        "Keypad 3",
        "Keypad 4",
        "Keypad 5",
        "Keypad 6",
        "Keypad 7",
        "Keypad 8",
        "Keypad 9",
        "Keypad 0",
        "Keypad .",
        null,
        "Application",
        "Power",
        "Keypad =",
        "F13",
        "F14",
        "F15",
        "F16",
        "F17",
        "F18",
        "F19",
        "F20",
        "F21",
        "F22",
        "F23",
        "F24",
        "Execute",
        "Help",
        "Menu",
        "Select",
        "Stop",
        "Again",
        "Undo",
        "Cut",
        "Copy",
        "Paste",
        "Find",
        "Mute",
        "VolumeUp",
        "VolumeDown",
        null, null, null,
        "Keypad ,",
        "Keypad = (AS400)",
        null, null, null, null, null, null, null, null, null, null, null, null,
        null, null, null, null, null, null,
        "AltErase",
        "SysReq",
        "Cancel",
        "Clear",
        "Prior",
        "Return",
        "Separator",
        "Out",
        "Oper",
        "Clear / Again",
        "CrSel",
        "ExSel",
        null, null, null, null, null, null, null, null, null, null, null,
        "Keypad 00",
        "Keypad 000",
        "ThousandsSeparator",
        "DecimalSeparator",
        "CurrencyUnit",
        "CurrencySubUnit",
        "Keypad (",
        "Keypad )",
        "Keypad {",
        "Keypad }",
        "Keypad Tab",
        "Keypad Backspace",
        "Keypad A",
        "Keypad B",
        "Keypad C",
        "Keypad D",
        "Keypad E",
        "Keypad F",
        "Keypad XOR",
        "Keypad ^",
        "Keypad %",
        "Keypad <",
        "Keypad >",
        "Keypad &",
        "Keypad &&",
        "Keypad |",
        "Keypad ||",
        "Keypad :",
        "Keypad #",
        "Keypad Space",
        "Keypad @",
        "Keypad !",
        "Keypad MemStore",
        "Keypad MemRecall",
        "Keypad MemClear",
        "Keypad MemAdd",
        "Keypad MemSubtract",
        "Keypad MemMultiply",
        "Keypad MemDivide",
        "Keypad +/-",
        "Keypad Clear",
        "Keypad ClearEntry",
        "Keypad Binary",
        "Keypad Octal",
        "Keypad Decimal",
        "Keypad Hexadecimal",
        null, null,
        "Left Ctrl",
        "Left Shift",
        "Left Alt",
        "Left GUI",
        "Right Ctrl",
        "Right Shift",
        "Right Alt",
        "Right GUI",
        null, null, null, null, null, null, null, null, null, null, null, null,
        null, null, null, null, null, null, null, null, null, null, null, null,
        null,
        "ModeSwitch",
        "AudioNext",
        "AudioPrev",
        "AudioStop",
        "AudioPlay",
        "AudioMute",
        "MediaSelect",
        "WWW",
        "Mail",
        "Calculator",
        "Computer",
        "AC Search",
        "AC Home",
        "AC Back",
        "AC Forward",
        "AC Stop",
        "AC Refresh",
        "AC Bookmarks",
        "BrightnessDown",
        "BrightnessUp",
        "DisplaySwitch",
        "KBDIllumToggle",
        "KBDIllumDown",
        "KBDIllumUp",
        "Eject",
        "Sleep",
    ];


} //Scancodes

