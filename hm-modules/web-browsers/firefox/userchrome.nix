{
  programs.firefox.profiles.nebu.userChrome =
    # css
    ''
      /* =========================
         Rose Pine-ish palette
         ========================= */
      :root {
        --rp-toolbar: rgb(31, 29, 46);
        --rp-toolbar-text: rgb(224, 222, 244);
        --rp-frame: rgb(25, 23, 36);
        --rp-tab-text: rgb(144, 140, 170);
        --rp-field: rgb(38, 35, 58);
        --rp-icons: rgb(235, 188, 186);
        --rp-attention: rgb(235, 111, 146);

        /* Force Firefox theme vars */
        --toolbar-bgcolor: var(--rp-toolbar) !important;
        --toolbar-color: var(--rp-toolbar-text) !important;

        --lwt-accent-color: var(--rp-frame) !important;
        --lwt-text-color: var(--rp-toolbar-text) !important;
        --lwt-toolbar-field-background-color: var(--rp-field) !important;
        --lwt-toolbar-field-color: var(--rp-toolbar-text) !important;

        --tab-selected-bgcolor: var(--rp-toolbar) !important;
        --tab-selected-textcolor: var(--rp-toolbar-text) !important;

        --toolbarbutton-icon-fill: var(--rp-icons) !important;
        --toolbarbutton-icon-fill-attention: var(--rp-attention) !important;

        /* Focus ring killers */
        --focus-outline-color: transparent !important;
        --toolbar-field-focus-border-color: transparent !important;
        --toolbar-field-border-color: transparent !important;
        --toolbar-field-focus-box-shadow: none !important;

        /* Urlbar internal vars (helps prevent state reversion) */
        --urlbar-box-bgcolor: var(--rp-field) !important;
        --urlbar-box-hover-bgcolor: var(--rp-field) !important;
        --urlbar-box-focus-bgcolor: var(--rp-field) !important;
        --urlbar-box-text-color: var(--rp-toolbar-text) !important;
      }

      /* =========================
         Top chrome (tabs + toolbars)
         ========================= */
      #navigator-toolbox {
        background-color: var(--rp-frame) !important;
        color: var(--rp-toolbar-text) !important;
      }

      #nav-bar,
      #PersonalToolbar {
        background-color: var(--rp-toolbar) !important;
        color: var(--rp-toolbar-text) !important;
      }

      /* Tabs */
      .tabbrowser-tab { color: var(--rp-tab-text) !important; }

      .tabbrowser-tab[selected],
      .tabbrowser-tab[multiselected] {
        color: var(--rp-toolbar-text) !important;
      }

      #TabsToolbar .tab-background[selected],
      #TabsToolbar .tab-background[multiselected] {
        background-color: var(--rp-toolbar) !important;
      }

      /* =========================
         Fields: URL bar + search
         Strategy:
         - paint the pill with .urlbar-background
         - keep #urlbar-input-container transparent so it can't cover it
         ========================= */
      #urlbar,
      #urlbar-container,
      #searchbar,
      .searchbar-textbox {
        color: var(--rp-toolbar-text) !important;
        border-color: transparent !important;
        box-shadow: none !important;
        outline: none !important;
        -moz-appearance: none !important;
      }

      /* The input container often sits above the background—keep it transparent */
      #urlbar-input-container,
      .urlbar-input-box {
        background-color: transparent !important;
        border: 0 !important;
        box-shadow: none !important;
        outline: none !important;
      }

      /* Paint layer (note: class, not just the old #id) */
      .urlbar-background {
        background-color: var(--rp-field) !important;
        background-image: none !important;
        border: 0 !important;
        box-shadow: none !important;
        outline: none !important;
      }

      /* Input itself */
      #urlbar-input,
      #urlbar-input::placeholder,
      .searchbar-textbox {
        background-color: transparent !important;
        color: var(--rp-toolbar-text) !important;
        -moz-appearance: none !important;
      }

      #urlbar-input::selection {
        background-color: rgba(235, 188, 186, 0.20) !important;
      }

      /* Focus/open/breakout states (keep same colors + kill grey ring) */
      #urlbar:is([open],[focused="true"],[breakout],[breakout-extend]) .urlbar-background {
        background-color: var(--rp-field) !important;
        background-image: none !important;
        border: 0 !important;
        box-shadow: none !important;
        outline: none !important;
      }

      #urlbar-container:focus-within,
      #nav-bar:focus-within #urlbar-container {
        outline: none !important;
        box-shadow: none !important;
      }

      /* =========================
         Urlbar dropdown (results)
         ========================= */
      #urlbar-results,
      #urlbar .urlbarView,
      .urlbarView {
        background-color: var(--rp-toolbar) !important; /* swap to --rp-field for a single-surface look */
        color: var(--rp-toolbar-text) !important;
        border: 0 !important;
        box-shadow: none !important;
        margin-top: 0 !important;
      }

      .urlbarView-body-inner { background-color: transparent !important; }

      .urlbarView-row,
      .urlbarView-row-inner {
        background-color: transparent !important;
        color: var(--rp-toolbar-text) !important;
      }

      .urlbarView-row:hover .urlbarView-row-inner,
      .urlbarView-row[selected] .urlbarView-row-inner,
      .urlbarView-row[aria-selected="true"] .urlbarView-row-inner {
        background-color: rgba(235, 188, 186, 0.15) !important;
      }

      .urlbarView-title { color: var(--rp-toolbar-text) !important; }
      .urlbarView-url   { color: var(--rp-tab-text) !important; }

      /* Search one-offs (footer) */
      #urlbar .search-one-offs,
      #urlbar .searchbar-engine-one-off-item {
        background-color: var(--rp-toolbar) !important;
        color: var(--rp-toolbar-text) !important;
        border: 0 !important;
        box-shadow: none !important;
      }

      #urlbar-searchmode-switcher {
        background-color: var(--rp-field) !important;
        fill: var(--rp-icons) !important;
      }

      .search-panel-one-offs-header-label { display: none !important; }

      /* =========================
         Popups / panels
         ========================= */
      panelview,
      panel,
      menupopup,
      popup {
        --panel-background: var(--rp-toolbar) !important;
        --panel-color: var(--rp-toolbar-text) !important;
      }
    '';
}
