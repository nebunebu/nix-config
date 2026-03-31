{ lib, ... }:
{
  programs.dank-material-shell.settings = lib.mkForce {
    currentThemeName = "custom";
    currentThemeCategory = "registry";
    customThemeFile = "/home/nebu/.config/DankMaterialShell/themes/rosePine/theme.json";
    registryThemeVariants = { };
    matugenScheme = "scheme-tonal-spot";
    runUserMatugenTemplates = false;
    matugenTargetMonitor = "";
    popupTransparency = 1;
    dockTransparency = 1;
    widgetBackgroundColor = "sch";
    widgetColorMode = "colorful";
    cornerRadius = 6;
    niriLayoutGapsOverride = -1;
    niriLayoutRadiusOverride = -1;
    niriLayoutBorderSize = -1;
    hyprlandLayoutGapsOverride = -1;
    hyprlandLayoutRadiusOverride = -1;
    hyprlandLayoutBorderSize = -1;
    mangoLayoutGapsOverride = -1;
    mangoLayoutRadiusOverride = -1;
    mangoLayoutBorderSize = -1;
    use24HourClock = false;
    showSeconds = false;
    useFahrenheit = true;
    nightModeEnabled = false;
    animationSpeed = 0;
    customAnimationDuration = 500;
    wallpaperFillMode = "Fill";
    blurredWallpaperLayer = false;
    blurWallpaperOnOverview = false;
    showLauncherButton = true;
    showWorkspaceSwitcher = true;
    showFocusedWindow = true;
    showWeather = true;
    showMusic = true;
    showClipboard = true;
    showCpuUsage = true;
    showMemUsage = true;
    showCpuTemp = true;
    showGpuTemp = true;
    selectedGpuIndex = 0;
    enabledGpuPciIds = [ ];
    showSystemTray = true;
    showClock = true;
    showNotificationButton = true;
    showBattery = true;
    showControlCenterButton = true;
    showCapsLockIndicator = true;
    controlCenterShowNetworkIcon = true;
    controlCenterShowBluetoothIcon = false;
    controlCenterShowAudioIcon = true;
    controlCenterShowAudioPercent = false;
    controlCenterShowVpnIcon = false;
    controlCenterShowBrightnessIcon = false;
    controlCenterShowBrightnessPercent = false;
    controlCenterShowMicIcon = false;
    controlCenterShowMicPercent = false;
    controlCenterShowBatteryIcon = false;
    controlCenterShowPrinterIcon = false;
    controlCenterShowScreenSharingIcon = true;
    showPrivacyButton = true;
    privacyShowMicIcon = false;
    privacyShowCameraIcon = false;
    privacyShowScreenShareIcon = false;
    controlCenterWidgets = [
      {
        id = "inputVolumeSlider";
        enabled = true;
        width = 50;
      }
      {
        id = "volumeSlider";
        enabled = true;
        width = 50;
      }
      {
        id = "brightnessSlider";
        enabled = true;
        width = 50;
      }
      {
        id = "audioOutput";
        enabled = true;
        width = 50;
      }
      {
        id = "bluetooth";
        enabled = true;
        width = 50;
      }
      {
        id = "audioInput";
        enabled = true;
        width = 50;
      }
      {
        id = "nightMode";
        enabled = true;
        width = 50;
      }
      {
        id = "darkMode";
        enabled = true;
        width = 50;
      }
      {
        id = "colorPicker";
        enabled = true;
        width = 50;
      }
      {
        id = "wifi";
        enabled = true;
        width = 50;
      }
      {
        id = "diskUsage";
        enabled = true;
        width = 50;
        instanceId = "mh3wrq0oza1dghle62vkmd1t2bwng";
        mountPath = "/";
      }
      {
        id = "doNotDisturb";
        enabled = true;
        width = 50;
      }
    ];
    showWorkspaceIndex = true;
    showWorkspaceName = false;
    showWorkspacePadding = false;
    workspaceScrolling = false;
    showWorkspaceApps = false;
    maxWorkspaceIcons = 3;
    groupWorkspaceApps = true;
    workspaceFollowFocus = false;
    showOccupiedWorkspacesOnly = true;
    reverseScrolling = false;
    dwlShowAllTags = false;
    workspaceColorMode = "default";
    workspaceOccupiedColorMode = "none";
    workspaceUnfocusedColorMode = "default";
    workspaceUrgentColorMode = "default";
    workspaceFocusedBorderEnabled = false;
    workspaceFocusedBorderColor = "primary";
    workspaceFocusedBorderThickness = 2;
    workspaceNameIcons = { };
    waveProgressEnabled = true;
    scrollTitleEnabled = true;
    audioVisualizerEnabled = true;
    audioScrollMode = "volume";
    clockCompactMode = false;
    focusedWindowCompactMode = true;
    runningAppsCompactMode = true;
    keyboardLayoutNameCompactMode = false;
    runningAppsCurrentWorkspace = false;
    runningAppsGroupByApp = false;
    appIdSubstitutions = [
      {
        pattern = "Spotify";
        replacement = "spotify";
        type = "exact";
      }
      {
        pattern = "beepertexts";
        replacement = "beeper";
        type = "exact";
      }
      {
        pattern = "home assistant desktop";
        replacement = "homeassistant-desktop";
        type = "exact";
      }
      {
        pattern = "com.transmissionbt.transmission";
        replacement = "transmission-gtk";
        type = "contains";
      }
      {
        pattern = "^steam_app_(\\d+)$";
        replacement = "steam_icon_$1";
        type = "regex";
      }
    ];
    centeringMode = "index";
    clockDateFormat = "ddd MMM d";
    lockDateFormat = "";
    mediaSize = 1;
    appLauncherViewMode = "list";
    spotlightModalViewMode = "list";
    sortAppsAlphabetically = false;
    appLauncherGridColumns = 4;
    spotlightCloseNiriOverview = true;
    niriOverviewOverlayEnabled = true;
    useAutoLocation = true;
    weatherEnabled = true;
    networkPreference = "wifi";
    vpnLastConnected = "4e0827b7-2bab-46ec-a479-b8f6449de7be";
    iconTheme = "System Default";
    cursorSettings = {
      theme = "System Default";
      size = 24;
      niri = {
        hideWhenTyping = false;
        hideAfterInactiveMs = 0;
      };
      hyprland = {
        hideOnKeyPress = false;
        hideOnTouch = false;
        inactiveTimeout = 0;
      };
      dwl = {
        cursorHideTimeout = 0;
      };
    };
    launcherLogoMode = "os";
    launcherLogoCustomPath = "";
    launcherLogoColorOverride = "#f6c177";
    launcherLogoColorInvertOnMode = false;
    launcherLogoBrightness = 0.5;
    launcherLogoContrast = 1;
    launcherLogoSizeOffset = 0;
    fontFamily = "BlexMono Nerd Font";
    monoFontFamily = "BlexMono Nerd Font";
    fontWeight = 800;
    fontScale = 1;
    notepadUseMonospace = true;
    notepadFontFamily = "";
    notepadFontSize = 14;
    notepadShowLineNumbers = false;
    notepadTransparencyOverride = -1;
    notepadLastCustomTransparency = 0.7;
    soundsEnabled = true;
    useSystemSoundTheme = false;
    soundNewNotification = true;
    soundVolumeChanged = true;
    soundPluggedIn = true;
    acMonitorTimeout = 0;
    acLockTimeout = 0;
    acSuspendTimeout = 0;
    acSuspendBehavior = 0;
    acProfileName = "";
    batteryMonitorTimeout = 0;
    batteryLockTimeout = 0;
    batterySuspendTimeout = 0;
    batterySuspendBehavior = 0;
    batteryProfileName = "";
    batteryChargeLimit = 100;
    lockBeforeSuspend = false;
    loginctlLockIntegration = true;
    fadeToLockEnabled = false;
    fadeToLockGracePeriod = 5;
    fadeToDpmsEnabled = true;
    fadeToDpmsGracePeriod = 5;
    launchPrefix = "";
    brightnessDevicePins = { };
    wifiNetworkPins = { };
    bluetoothDevicePins = { };
    audioInputDevicePins = { };
    audioOutputDevicePins = { };
    gtkThemingEnabled = false;
    qtThemingEnabled = false;
    syncModeWithPortal = true;
    terminalsAlwaysDark = false;
    runDmsMatugenTemplates = true;
    matugenTemplateGtk = true;
    matugenTemplateNiri = true;
    matugenTemplateHyprland = true;
    matugenTemplateMangowc = true;
    matugenTemplateQt5ct = true;
    matugenTemplateQt6ct = true;
    matugenTemplateFirefox = true;
    matugenTemplatePywalfox = true;
    matugenTemplateZenBrowser = true;
    matugenTemplateVesktop = true;
    matugenTemplateEquibop = true;
    matugenTemplateGhostty = true;
    matugenTemplateKitty = true;
    matugenTemplateFoot = true;
    matugenTemplateAlacritty = true;
    matugenTemplateNeovim = true;
    matugenTemplateWezterm = true;
    matugenTemplateDgop = true;
    matugenTemplateKcolorscheme = true;
    matugenTemplateVscode = true;
    showDock = true;
    dockAutoHide = true;
    dockSmartAutoHide = false;
    dockGroupByApp = true;
    dockOpenOnOverview = false;
    dockPosition = 1;
    dockSpacing = 4;
    dockBottomGap = 0;
    dockMargin = 0;
    dockIconSize = 40;
    dockIndicatorStyle = "circle";
    dockBorderEnabled = false;
    dockBorderColor = "surfaceText";
    dockBorderOpacity = 1;
    dockBorderThickness = 1;
    dockIsolateDisplays = false;
    notificationOverlayEnabled = false;
    modalDarkenBackground = false;
    lockScreenShowPowerActions = true;
    lockScreenShowSystemIcons = true;
    lockScreenShowTime = true;
    lockScreenShowDate = true;
    lockScreenShowProfileImage = true;
    lockScreenShowPasswordField = true;
    lockScreenPowerOffMonitorsOnLock = false;
    enableFprint = false;
    maxFprintTries = 3;
    lockScreenActiveMonitor = "all";
    lockScreenInactiveColor = "#000000";
    lockScreenNotificationMode = 0;
    hideBrightnessSlider = false;
    notificationTimeoutLow = 5000;
    notificationTimeoutNormal = 5000;
    notificationTimeoutCritical = 5000;
    notificationCompactMode = false;
    notificationPopupPosition = 0;
    notificationHistoryEnabled = true;
    notificationHistoryMaxCount = 50;
    notificationHistoryMaxAgeDays = 7;
    notificationHistorySaveLow = true;
    notificationHistorySaveNormal = true;
    notificationHistorySaveCritical = true;
    osdAlwaysShowValue = true;
    osdPosition = 5;
    osdVolumeEnabled = true;
    osdMediaVolumeEnabled = true;
    osdBrightnessEnabled = true;
    osdIdleInhibitorEnabled = true;
    osdMicMuteEnabled = true;
    osdCapsLockEnabled = true;
    osdPowerProfileEnabled = false;
    osdAudioOutputEnabled = true;
    powerActionConfirm = true;
    powerActionHoldDuration = 1;
    powerMenuActions = [
      "reboot"
      "logout"
      "poweroff"
      "lock"
      "suspend"
      "restart"
    ];
    powerMenuDefaultAction = "logout";
    powerMenuGridLayout = false;
    customPowerActionLock = "";
    customPowerActionLogout = "";
    customPowerActionSuspend = "";
    customPowerActionHibernate = "";
    customPowerActionReboot = "";
    customPowerActionPowerOff = "";
    updaterHideWidget = false;
    updaterUseCustomCommand = false;
    updaterCustomCommand = "";
    updaterTerminalAdditionalParams = "";
    displayNameMode = "model";
    screenPreferences = {
      notepad = [ "all" ];
      systemTray = [ "all" ];
      wallpaper = [
        {
          name = "DP-1";
          model = "DELL P2419H";
        }
        {
          name = "DP-2";
          model = "HP M27ha";
        }
      ];
    };
    showOnLastDisplay = { };
    niriOutputSettings = { };
    hyprlandOutputSettings = { };
    barConfigs = [
      {
        id = "default";
        name = "Main Bar";
        enabled = true;
        position = 0;
        screenPreferences = [
          {
            name = "DP-1";
            model = "DELL P2419H";
          }
        ];
        showOnLastDisplay = false;
        leftWidgets = [
          {
            id = "network_speed_monitor";
            enabled = true;
          }
          {
            id = "music";
            enabled = true;
          }
        ];
        centerWidgets = [
          {
            id = "workspaceSwitcher";
            enabled = true;
          }
        ];
        rightWidgets = [
          {
            id = "colorPicker";
            enabled = true;
          }
          {
            id = "privacyIndicator";
            enabled = true;
          }
          {
            id = "notificationButton";
            enabled = true;
          }
          {
            id = "systemTray";
            enabled = true;
          }
          {
            id = "controlCenterButton";
            enabled = true;
          }
        ];
        spacing = 0;
        innerPadding = 6;
        bottomGap = 0;
        transparency = 0;
        widgetTransparency = 1;
        squareCorners = false;
        noBackground = false;
        gothCornersEnabled = false;
        gothCornerRadiusOverride = false;
        gothCornerRadiusValue = 12;
        borderEnabled = false;
        borderColor = "surfaceText";
        borderOpacity = 1;
        borderThickness = 1;
        fontScale = 1;
        autoHide = false;
        autoHideDelay = 250;
        openOnOverview = false;
        visible = true;
        popupGapsAuto = true;
        popupGapsManual = 9;
        shadowColorMode = "text";
        shadowIntensity = 100;
        widgetOutlineEnabled = false;
        shadowOpacity = 100;
        shadowCustomColor = "#d84315";
        widgetOutlineColor = "surfaceText";
        widgetOutlineThickness = 1;
      }
      {
        id = "bar1766905487540";
        name = "Bar 2";
        enabled = true;
        position = 0;
        screenPreferences = [
          {
            name = "DP-2";
            model = "HP M27ha";
          }
        ];
        showOnLastDisplay = false;
        leftWidgets = [
          {
            id = "dankPomodoroTimer";
            enabled = true;
          }
          {
            id = "clock";
            enabled = true;
          }
        ];
        centerWidgets = [
          {
            id = "workspaceSwitcher";
            enabled = true;
          }
        ];
        rightWidgets = [ ];
        spacing = 0;
        innerPadding = 3;
        bottomGap = 1;
        transparency = 0;
        widgetTransparency = 1;
        squareCorners = false;
        noBackground = false;
        gothCornersEnabled = false;
        gothCornerRadiusOverride = false;
        gothCornerRadiusValue = 12;
        borderEnabled = false;
        borderColor = "surfaceText";
        borderOpacity = 1;
        borderThickness = 1;
        widgetOutlineEnabled = false;
        widgetOutlineColor = "primary";
        widgetOutlineOpacity = 1;
        widgetOutlineThickness = 1;
        fontScale = 1;
        autoHide = false;
        autoHideDelay = 250;
        showOnWindowsOpen = false;
        openOnOverview = false;
        visible = true;
        popupGapsAuto = true;
        popupGapsManual = 9;
        maximizeDetection = true;
        scrollEnabled = true;
        scrollXBehavior = "column";
        scrollYBehavior = "workspace";
      }
    ];
    desktopClockEnabled = false;
    desktopClockStyle = "analog";
    desktopClockTransparency = 0.8;
    desktopClockColorMode = "primary";
    desktopClockCustomColor = {
      r = 1;
      g = 1;
      b = 1;
      a = 1;
      hsvHue = -1;
      hsvSaturation = 0;
      hsvValue = 1;
      hslHue = -1;
      hslSaturation = 0;
      hslLightness = 1;
      valid = true;
    };
    desktopClockShowDate = true;
    desktopClockShowAnalogNumbers = false;
    desktopClockShowAnalogSeconds = true;
    desktopClockX = -1;
    desktopClockY = -1;
    desktopClockWidth = 280;
    desktopClockHeight = 180;
    desktopClockDisplayPreferences = [ "all" ];
    systemMonitorEnabled = false;
    systemMonitorShowHeader = true;
    systemMonitorTransparency = 0.8;
    systemMonitorColorMode = "primary";
    systemMonitorCustomColor = {
      r = 1;
      g = 1;
      b = 1;
      a = 1;
      hsvHue = -1;
      hsvSaturation = 0;
      hsvValue = 1;
      hslHue = -1;
      hslSaturation = 0;
      hslLightness = 1;
      valid = true;
    };
    systemMonitorShowCpu = true;
    systemMonitorShowCpuGraph = true;
    systemMonitorShowCpuTemp = true;
    systemMonitorShowGpuTemp = false;
    systemMonitorGpuPciId = "";
    systemMonitorShowMemory = true;
    systemMonitorShowMemoryGraph = true;
    systemMonitorShowNetwork = true;
    systemMonitorShowNetworkGraph = true;
    systemMonitorShowDisk = true;
    systemMonitorShowTopProcesses = false;
    systemMonitorTopProcessCount = 3;
    systemMonitorTopProcessSortBy = "cpu";
    systemMonitorGraphInterval = 60;
    systemMonitorLayoutMode = "auto";
    systemMonitorX = -1;
    systemMonitorY = -1;
    systemMonitorWidth = 320;
    systemMonitorHeight = 480;
    systemMonitorDisplayPreferences = [ "all" ];
    systemMonitorVariants = [ ];
    desktopWidgetPositions = { };
    desktopWidgetGridSettings = { };
    desktopWidgetInstances = [
      {
        id = "dw_1768300549125_7dj5z3nev";
        widgetType = "desktopClock";
        name = "Desktop Clock";
        enabled = true;
        config = {
          style = "stacked";
          transparency = 0;
          colorMode = "secondary";
          customColor = "#ffffff";
          showDate = true;
          showAnalogNumbers = false;
          showAnalogSeconds = true;
          displayPreferences = [
            {
              name = "DP-1";
              model = "DELL P2419H";
            }
          ];
          showOnOverlay = false;
        };
        positions = {
          "DELL P2419H" = {
            x = 601.45703125;
            y = 219.84765625;
            width = 160;
            height = 220;
          };
          "HP M27ha" = {
            width = 160;
            height = 220;
            x = 880;
            y = 430;
          };
        };
      }
      {
        id = "dw_1768300565645_1qox69b93";
        widgetType = "systemMonitor";
        name = "System Monitor";
        enabled = true;
        config = {
          showHeader = false;
          transparency = 0.82;
          colorMode = "secondary";
          customColor = "#ffffff";
          showCpu = true;
          showCpuGraph = true;
          showCpuTemp = true;
          showGpuTemp = false;
          gpuPciId = "";
          showMemory = true;
          showMemoryGraph = true;
          showNetwork = true;
          showNetworkGraph = true;
          showDisk = true;
          showTopProcesses = true;
          topProcessCount = 10;
          topProcessSortBy = "cpu";
          layoutMode = "list";
          graphInterval = 60;
          displayPreferences = [
            {
              name = "DP-1";
              model = "DELL P2419H";
            }
          ];
          showOnOverlay = false;
        };
        positions = {
          "DELL P2419H" = {
            x = 1491.87890625;
            y = 123.7734375;
            width = 397.86328125;
            height = 507.78125;
          };
          "HP M27ha" = {
            width = 320;
            height = 480;
            x = 800;
            y = 300;
          };
        };
      }
      {
        id = "dw_1768300570529_9a2ykp4br";
        widgetType = "appShortcut";
        name = "Application Shortcut";
        enabled = false;
        config = {
          displayPreferences = [ "all" ];
          showOnOverlay = true;
          drawOutlines = false;
          shortcutApp = "com.obsproject.Studio";
        };
        positions = {
          "DELL P2419H" = {
            x = 512.9296875;
            y = 43.58984375;
            width = 326.90625;
            height = 326.90625;
          };
          "HP M27ha" = {
            width = 200;
            height = 200;
            x = 860;
            y = 440;
          };
        };
      }
      {
        id = "dw_1768300576384_3ztamcyuk";
        widgetType = "dankDesktopWeather";
        name = "Dank Desktop Weather";
        enabled = true;
        config = {
          displayPreferences = [
            {
              name = "DP-1";
              model = "DELL P2419H";
            }
          ];
          showOnOverlay = false;
          viewMode = "detailed";
          colorMode = "secondary";
          showLocation = false;
          showPressure = true;
          backgroundOpacity = 75;
          showCondition = true;
          showFeelsLike = true;
          showHourlyForecast = true;
          customColor = {
            r = 0.8470740914344788;
            g = 0.26269933581352234;
            b = 0.08235294371843338;
            a = 1.0;
            hsvHue = 0.03930555656552315;
            hsvSaturation = 0.9027847647666931;
            hsvValue = 0.8470740914344788;
            hslHue = 0.03930555656552315;
            hslSaturation = 0.8227817416191101;
            hslLightness = 0.46471351385116577;
            valid = true;
          };
        };
        positions = {
          "DELL P2419H" = {
            x = 51.65625;
            y = 565.91015625;
            width = 663.86328125;
            height = 445.98046875;
          };
          "HP M27ha" = {
            width = 200;
            height = 200;
            x = 860;
            y = 440;
          };
        };
      }
      {
        id = "dw_1768300579944_odqqvtvd2";
        widgetType = "desktopCommand";
        name = "Nix Logo";
        enabled = false;
        config = {
          displayPreferences = [
            {
              name = "DP-1";
              model = "DELL P2419H";
            }
          ];
          showOnOverlay = false;
          command = "fastfetch --structure logo --logo-color-1 '#9ccfd8' --logo-color-2 '#c4a7e7'";
          autoRefresh = false;
          commandTimeout = "3";
          refreshInterval = "5";
          enableBorder = false;
          useDank16 = true;
          fontSize = 16;
          backgroundOpacity = 0;
        };
        positions = {
          "DELL P2419H" = {
            x = 27.34765625;
            y = 580.5390625;
            width = 446.59765625;
            height = 463.00390625;
          };
          "HP M27ha" = {
            x = 783.3515625;
            y = 398.19921875;
            width = 284.07421875;
            height = 314.05078125;
          };
        };
      }
      {
        id = "dw_1768300583301_uprkin0y7";
        widgetType = "mediaPlayer";
        name = "Media Player";
        enabled = true;
        config = {
          displayPreferences = [
            {
              name = "DP-1";
              model = "DELL P2419H";
            }
          ];
          clickThrough = true;
          syncPositionAcrossScreens = true;
        };
        positions = {
          "DELL P2419H" = {
            x = 28.609375;
            y = 83.16015625;
            width = 576.37109375;
            height = 203.76171875;
          };
          "HP M27ha" = {
            width = 320;
            height = 200;
            x = 800;
            y = 440;
          };
          "_synced" = {
            x = 0.014900716145833333;
            y = 0.07700014467592593;
            width = 576.37109375;
            height = 203.76171875;
          };
        };
      }
      {
        id = "dw_1768302280657_27wwt1ylg";
        widgetType = "desktopCommand";
        name = "Nix Logo (Copy)";
        enabled = false;
        config = {
          displayPreferences = [
            {
              name = "DP-1";
              model = "DELL P2419H";
            }
          ];
          showOnOverlay = false;
          command = "ps aux";
          autoRefresh = true;
          commandTimeout = "3";
          refreshInterval = "5";
          enableBorder = false;
          useDank16 = true;
          fontSize = 16;
          backgroundOpacity = 100;
        };
        positions = {
          "DELL P2419H" = {
            x = 345.078125;
            y = 524.328125;
            width = 1133.8671875;
            height = 432.50390625;
          };
          "HP M27ha" = {
            width = 200;
            height = 200;
            x = 860;
            y = 440;
          };
        };
      }
    ];
    desktopWidgetGroups = [ ];
    builtInPluginSettings = { };
    configVersion = 5;
  };
}
