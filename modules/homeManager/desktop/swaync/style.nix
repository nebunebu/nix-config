{
  services.swaync.style = # css
    ''
      @define-color base rgb(25, 23, 36);
      @define-color surface rgb(31, 29, 46);
      @define-color overlay rgb(38, 35, 58);
      @define-color muted rgb(110, 106, 134);
      @define-color subtle rgb(144, 140, 170);
      @define-color text rgb(224, 222, 244);
      @define-color love rgb(235, 111, 146);
      @define-color gold rgb(246, 193, 119);
      @define-color rose rgb(235, 188, 186);
      @define-color pine rgb(49, 116, 143);
      @define-color foam rgb(156, 207, 216);
      @define-color iris rgb(196, 167, 231);
      @define-color highlight-low rgb(33, 32, 46);
      @define-color highlight-med rgb(64, 61, 82);
      @define-color highlight-high rgb(82, 79, 103);

      .notification-row {
        transition: all 200ms ease;
        outline: none;
        margin-bottom: 4px;
        margin-right: 13px;
        margin-top: 8px;
        border-radius: 80px;
      }

      .control-center .notification-row:focus,
      .control-center .notification-row:hover {
        opacity: 1;
        background: @overlay;
      }

      .notification-row:focus .notification,
      .notification-row:hover .notification {
        box-shadow: 0 1px 3px 1px rgba(0, 0, 0, 0.5);
        border: 0px solid @foam;
        background: @base;
      }

      .control-center .notification {
        box-shadow: none;
      }

      .control-center .notification-row {
        opacity: 0.5;
        margin: -5px;
      }

      .notification {
        transition: all 200ms ease;
        border-radius: 8px;
        margin: 12px 7px 0px 7px;
        box-shadow: 0 1px 3px 1px rgba(0, 0, 0, 0.5);
        padding: 0;
      }

      .low {
        background: #f6c177;
        padding: 6px;
        border-radius: 12px;
      }

      /*
      .normal {
        background: green;
        padding: 6px;
        border-radius: 12px;
      }

      .critical {
        background: red;
        padding: 6px;
        border-radius: 12px;
      }

      .notification-content {
        background: transparent;
        padding: 6px;
        border-radius: 8px;
      }
      */

      .close-button {
        background: @base;
        color: @text;
        text-shadow: none;
        padding: 0;
        border-radius: 100%;
        margin-top: 17px;
        margin-right: 10px;
        box-shadow: none;
        border: none;
        min-width: 24px;
        min-height: 24px;
      }

      .close-button:hover {
        box-shadow: none;
        background: @base;
        transition: all 0.15s ease-in-out;
        border: none;
      }

      .notification-default-action,
      .notification-action {
        padding: 4px;
        margin: 0;
        box-shadow: none;
        background: @base;
        border: 2px solid @gold;
        color: @text;
      }

      .notification-default-action:hover,
      .notification-action:hover {
        -gtk-icon-effect: none;
        background: @base;
      }

      .notification-default-action {
        border-radius: 8px;
      }

      /* When alternative actions are visible */
      .notification-default-action:not(:only-child) {
        border-bottom-left-radius: 0px;
        border-bottom-right-radius: 0px;
      }

      .notification-action {
        border-radius: 0px;
        border-top: none;
        border-right: none;
      }

      /* add bottom border radius to eliminate clipping */
      .notification-action:first-child {
        border-bottom-left-radius: 8px;
      }

      .notification-action:last-child {
        border-bottom-right-radius: 8px;
        border-right: 1px solid @gold;
      }

      .image {}

      .body-image {
        margin-top: 6px;
        background-color: @text;
        border-radius: 8px;
      }

      .summary {
        font-size: 16px;
        font-weight: bold;
        background: transparent;
        color: @text;
        text-shadow: none;
      }

      .time {
        font-size: 16px;
        font-weight: bold;
        background: transparent;
        color: @foreground;
        text-shadow: none;
        margin-right: 18px;
      }

      .body {
        font-size: 15px;
        font-weight: normal;
        background: transparent;
        color: @text;
        text-shadow: none;
      }

      /* The "Notifications" and "Do Not Disturb" text widget */
      .top-action-title {
        color: @text;
        text-shadow: none;
      }

      .control-center-clear-all {
        color: @text;
        text-shadow: none;
        background: @base;
        border: 2px solid @gold;
        box-shadow: none;
        border-radius: 8px;
      }

      .control-center-clear-all:hover {
        background: @base;
      }

      .control-center-dnd {
        border-radius: 8px;
        background: @base;
        border: 1px solid @gold;
        box-shadow: none;
      }

      .control-center-dnd:checked {
        background: @gold;
      }

      .control-center-dnd slider {
        background: @base;
        border-radius: 8px;
      }

      .control-center {
        background: @surface;
        border-radius: 10px;
        background-clip: border-box;
        padding: 4px;
        margin: 12px;
        box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.3), 0 1px 3px 1px rgba(0, 0, 0, 0.7),
          0 2px 6px 2px rgba(0, 0, 0, 0.3);
        color: @text;
        border: 2px solid @gold;
      }

      .control-center-list {
        background: transparent;
      }

      .floating-notifications {
        background: transparent;
      }

      /* Window behind control center and on all other monitors */
      .blank-window {
        background: transparent;
      }

      /*** Widgets ***/

      /* Title widget */
      .widget-title {
        margin: 8px;
        font-size: 1.5rem;
      }

      .widget-title>button {
        font-size: initial;
        color: @text;
        text-shadow: none;
        background: @base;
        border: 2px solid @gold;
        box-shadow: none;
        border-radius: 8px;
      }

      .widget-title>button:hover {
        background: @base;
      }

      /* volume widget */
      .volume {
        background: @overlay;
      }

      /* DND widget */
      .widget-dnd {
        margin: 8px;
        font-size: 1.1rem;
      }

      .widget-dnd>switch {
        font-size: initial;
        border-radius: 8px;
        background: @base;
        border: 1px solid @gold;
        box-shadow: none;
      }

      .widget-dnd>switch:checked {
        background: @gold;
      }

      .widget-dnd>switch slider {
        background: @base;
        border-radius: 8px;
        border: 1px solid @text;
      }

      /* Label widget */
      .widget-label {
        margin: 8px;
      }

      .widget-label>label {
        font-size: 1.1rem;
      }

      /* Mpris widget */
      .widget-mpris {
        /* The parent to all players */
      }

      .widget-mpris-player {
        padding: 8px;
        margin: 8px;
        background-color: @base;
        border-radius: 8px;
        border: 2px solid @gold;
        color: @text;
      }

      .widget-mpris-title {
        font-weight: bold;
        font-size: 1.25rem;
      }

      .widget-mpris-subtitle {
        font-size: 1.1rem;
      }
    '';
}
