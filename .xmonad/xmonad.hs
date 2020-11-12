-- A template showing all available configuration hooks,
-- and how to override the defaults in your own xmonad.hs conf file.
--
-- Normally, you'd only override those defaults you care about.

-- Conventional imports
import qualified Data.Map as M
import System.Exit ( exitSuccess )
import XMonad
import qualified XMonad.StackSet as W

-- Added by user
import Graphics.X11.Types ( noModMask )
import Graphics.X11.ExtraTypes.XF86
import XMonad.Hooks.DynamicLog ( PP (ppLayout, ppSort, ppTitle
   , ppTitleSanitize, ppVisible), statusBar, wrap )
import XMonad.Hooks.EwmhDesktops ( ewmh, fullscreenEventHook )
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
   ( ToggleStruts (..), avoidStruts, manageDocks )
import XMonad.Hooks.ManageHelpers
   -- ( (-?>), composeOne, doCenterFloat, isDialog, transience )
   ( (-?>), composeOne, isDialog, transience )
import XMonad.Hooks.SetWMName ( setWMName )
import XMonad.Layout.MultiColumns ( multiCol )
import XMonad.Layout.Tabbed ( simpleTabbed )
import XMonad.Layout.ThreeColumns ( ThreeCol (ThreeCol, ThreeColMid) )
import XMonad.Prompt ( XPPosition (Top), alwaysHighlight, font
   , position, promptBorderWidth, fgColor, bgColor, height, fgHLight, bgHLight )
import XMonad.Prompt.ConfirmPrompt ( confirmPrompt )
import XMonad.Prompt.Shell ( shellPrompt )
import XMonad.Util.WorkspaceCompare ( getSortByXineramaRule )

import XMonad.Layout.NoBorders (smartBorders)
import XMonad.Layout.Spacing

-- For xmobar
import XMonad.Util.Run
import XMonad.Util.NamedActions
import XMonad.Util.SpawnOnce
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.ManageHook

import XMonad.Actions.FloatKeys
import XMonad.Actions.Submap
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.NamedScratchpad

-- workspace switching
import XMonad.Actions.CycleWS

-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
myTerminal      = "alacritty"

-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

-- Whether clicking on a window to focus also passes the click to the window
myClickJustFocuses :: Bool
myClickJustFocuses = False

-- Width of the window border in pixels.
myBorderWidth   = 2

-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
myModMask       = mod4Mask  -- The Windows logo key

-- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.
--
-- A tagging example:
--
-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]
myWorkspaces    = ["1","2","3","4","5","6","7","8","9"]

-- Border colors for unfocused and focused windows, respectively.
myNormalBorderColor  = "#4C566A"
myFocusedBorderColor = "#88C0D0"

--------------------------------------------------------------------------------
-- | Customize the way 'XMonad.Prompt' looks and behaves.  It's a
-- great replacement for dzen.
myXPConfig = def
  { position          = Top
  , alwaysHighlight   = True
  , bgColor = "#2E3440"
  , fgColor = "#88C0D0"
  , bgHLight = "#88C0D0"
  , fgHLight = "#2e3440"
  , promptBorderWidth = 0
  , height = 25
  , font              = "xft:Overpass Display:size=13"
  }

-----------------------------------------------------------------------------
    -- SCRATCHPADS
myScratchPads :: [NamedScratchpad]
myScratchPads = [ NS "tmux" spawnTerm findTerm manageTerm,
                  NS "pavucontrol" "pavucontrol" (className =? "Pavucontrol")
                     (customFloating $ W.RationalRect (1/4) (1/4) (2/4) (2/4)),
                  NS "htop" spawnHtop (resource =? "htop")
                     (customFloating $ W.RationalRect (1/4) (1/4) (2/4) (2/4))

                ]
  where
    spawnTerm  = myTerminal ++ " --class terminal -e tmux"
    spawnHtop  = myTerminal ++ " --class htop -e htop"
    findTerm   = resource =? "terminal"
    manageTerm = customFloating $ W.RationalRect l t w h
               where
                 h = 0.9
                 w = 0.9
                 t = 0.95 -h
                 l = 0.95 -w
------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

    -- launch a terminal
    [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)

    -- launch dmenu
    --, ((modm,               xK_p     ), spawn "dmenu_run")

    -- launch gmrun
    -- , ((modm .|. shiftMask, xK_p     ), spawn "gmrun")

    -- close focused window
    , ((modm .|. shiftMask, xK_c     ), kill)

     -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    -- Resize viewed windows to the correct size
    , ((modm,               xK_n     ), refresh)

    -- Move focus to the next window
    , ((modm,               xK_Tab   ), windows W.focusDown)

    -- Move focus to the next window
    , ((modm,               xK_j     ), windows W.focusDown)

    -- Move focus to the previous window
    , ((modm,               xK_k     ), windows W.focusUp  )

    -- Move focus to the master window
    , ((modm,               xK_m     ), windows W.focusMaster  )

    -- Swap the focused window and the master window
    , ((modm,               xK_Return), windows W.swapMaster)

    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )

    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )

    -- Shrink the master area
    , ((modm,               xK_h     ), sendMessage Shrink)

    -- Expand the master area
    , ((modm,               xK_l     ), sendMessage Expand)

    -- Push window back into tiling
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)

    -- Increment the number of windows in the master area
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))

    -- Deincrement the number of windows in the master area
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))

    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
    , ((modm              , xK_b     ), sendMessage ToggleStruts)

    -- Quit xmonad
    -- , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))

    -- Restart xmonad
    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")

    -- Run xmessage with a summary of the default keybindings (useful for beginners)
    , ((modm .|. shiftMask, xK_i ), spawn ("echo \"" ++ help ++ "\" | xmessage -file -"))


    -- Added by user
    -- cycle backwards through windows
    , ((modm .|. shiftMask, xK_Tab   ), windows W.focusUp)

    -- swap master with next window in stack
    , ((modm , xK_a ), windows $ W.swapMaster . W.focusDown )
    , ((modm .|. shiftMask , xK_a ), windows $ W.swapMaster . W.focusUp )

    -- next workspace
    , ((modm,               xK_Right),  nextWS)
    , ((modm,               xK_Left),   prevWS)
    -- next nonempty WS
    , ((modm .|. shiftMask , xK_h   ), moveTo Prev NonEmptyWS)
    , ((modm .|. shiftMask , xK_l ), moveTo Next NonEmptyWS)
    -- toggle between WS
     , ((modm,               xK_z),     toggleWS)
    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q     ), confirmPrompt myXPConfig "exit" (io exitSuccess))


    -- shutdown menu
    -- , ((modm, xK_a), submap . M.fromList $
    --    [ ((0, xK_l), spawn "notify-send 'blurlock'")
    --    , ((0, xK_s), spawn "blurlock && systemctl suspend")
    --    , ((0, xK_r), spawn "systemctl reboot")
    --    , ((0, xK_o), spawn "systemctl poweroff -i")
    --    ])

    -- launch xscreensaver-command -lock
    -- , ((modm .|. shiftMask, xK_l     ), spawn "xscreensaver-command -lock")

    -- launch xscreensaver-command -lock AND power the monitor down
    -- , ((modm .|. controlMask, xK_l   ), spawn "xscreensaver-command -lock; sleep 1; xset dpms force off")

    -- launch XMonad app prompt
    , ((modm,               xK_p     ), shellPrompt myXPConfig)


    -- Scratchpads
     , ((modm              , xK_i), namedScratchpadAction myScratchPads "htop")
     , ((modm              , xK_u), namedScratchpadAction myScratchPads "tmux")
     , ((modm .|. shiftMask, xK_u), namedScratchpadAction myScratchPads "pavucontrol")

    -- control screen brightness
    -- These are the codes the function keys generate on my Lenovo X1 Carbon gen6
    -- xbacklight is in the xorg-xbacklight package in Arch
    -- , ((noModMask, xF86XK_MonBrightnessDown), spawn "xbacklight -dec 10")
    -- , ((noModMask, xF86XK_MonBrightnessUp  ), spawn "xbacklight -inc 10")
    -- , ((0, xF86XK_AudioMute), spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle")
    -- , ((0, xF86XK_AudioLowerVolume), spawn "pactl set-sink-volume @DEFAULT_SINK@ -10%")
    -- , ((0, xF86XK_AudioRaiseVolume), spawn "pactl set-sink-volume @DEFAULT_SINK@ +10%")
    , ((modm , xK_t), withFocused toggleFloat)
    , ((modm, xK_Left), withFocused $ keysMoveWindow (-20, 0))
    , ((modm, xK_Right), withFocused $ keysMoveWindow (20, 0))
    , ((modm, xK_Up), withFocused $ keysMoveWindow (0, -20))
    , ((modm, xK_Down), withFocused $ keysMoveWindow (0, 20))
    , ((modm .|. shiftMask, xK_Left     ), withFocused (keysResizeWindow (-10,-10) (1,1)))
    , ((modm .|. shiftMask, xK_Right     ), withFocused (keysResizeWindow (10,10) (1,1)))
    , ((modm .|. shiftMask, xK_Up     ), withFocused (keysAbsResizeWindow (-10,-10) (1024,752)))
    , ((modm .|. shiftMask, xK_Down     ), withFocused (keysAbsResizeWindow (10,10) (1024,752)))
        ]
    ++

    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shif-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        -- This is normal
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        -- Swapped w and e because of confusion between nVidia settings for primary and what xmonad sees from xinerama/xrandr
        -- | (key, sc) <- zip [xK_e, xK_w, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
    where
    toggleFloat w = windows (\s -> if M.member w (W.floating s)
                    then W.sink w s
                    else (W.float w (W.RationalRect (1/6) (1/6) (2/3) (2/3)) s))

------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))

    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]

------------------------------------------------------------------------
-- Layouts:

-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--
myLayout = avoidStruts $
   smartBorders $
   -- mySpacing $
   tiled |||
   Mirror tiled |||
   Full |||
   multiCol [1] 1 0.01 (-0.5) |||  -- Many equal columns!
   ThreeCol nmaster delta (1/3) |||  -- Three equal columns with resizing
   ThreeColMid nmaster delta ratio |||
   simpleTabbed
   where
      -- default tiling algorithm partitions the screen into two panes
      tiled   = Tall nmaster delta ratio

      -- The default number of windows in the master pane
      nmaster = 1

      -- Default proportion of screen occupied by master pane
      ratio   = 1/2

      -- Percent of screen to increment by when resizing panes
      delta   = 3/100

--------------------------------------------------------------------------------
-- AESTHETICS
--------------------------------------------------------------------------------

-- Gaps around and between windows
-- Changes only seem to apply if I log out then in again
-- Dimensions are given as (Border top bottom right left)
mySpacing = spacingRaw False
                       (Border 10 0 10 0)
                       True
                       (Border 0 10 0 10)
                       True
                       -- $ Tall (1 (3/100) (1/2)) ||| Full
------------------------------------------------------------------------
-- Window rules:

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
-- myManageHook :: XMonad.Query (Data.Monoid.Endo WindowSet)
myManageHook = composeOne
  -- None of these apps are installed on my system now
  [ className =? "@joplin/app-desktop" -?> doFloat
  --, className =? "XCalc"  -?> doFloat
  --, className =? "mpv"    -?> doFloat
  -- [ className =? "Godot"  -?> doFloat

  -- Gimp now has a single-window mode
  --, className =? "Gimp"   -?> doFloat

  -- Not sure what these used to do
  --, resource  =? "desktop_window" --> doIgnore
  --, resource  =? "kdesktop"       --> doIgnore

  -- This turned out to be annoying
  -- , isDialog -?> doCenterFloat
  -- , isDialog -?> doFloat

  -- Move transient windows to their parent:
  -- , transience
  ]
------------------------------------------------------------------------
-- Event handling

-- * EwmhDesktops users should change this to ewmhDesktopsEventHook
--
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
--myEventHook = mempty
-- myEventHook = handleEventHook def <+> fullscreenEventHook
myEventHook = fullscreenEventHook
------------------------------------------------------------------------
-- Status bars and logging

-- Perform an arbitrary action on each internal state change or X event.
-- See the 'XMonad.Hooks.DynamicLog' extension for examples.
--
myLogHook = return ()
-- This one came from defaultDesktop config example:
--myLogHook = dynamicLogString def >>= xmonadPropLog

------------------------------------------------------------------------
-- Startup hook

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
-- myStartupHook = return ()
myStartupHook = do
                spawnOnce "nitrogen --restore"
                -- spawn "stalonetray"
                spawnOnce "greenclip daemon"
                spawnOnce "nextcloud"
                spawnOnce "sxhkd -m -1 -c ~/.config/sxhkd/sxmonadrc"
                setWMName "LG3D" -- JVM hack

------------------------------------------------------------------------
-- My custom stdin pretty-printer for xmobar. Only interested in
-- workspaces at this time
myPP = def
   {
   -- ppLayout = const ""  -- Don't show the layout name
    ppTitle   = titleStyle
  -- , ppSep =  "<fc=#666666> <fn=2>|</fn> </fc>"                     -- Separators in xmobar
  , ppCurrent = currentStyle
  , ppHidden  = visibleStyle
  , ppVisible = visibleStyle
  , ppSort = fmap (namedScratchpadFilterOutWorkspace .) (ppSort def)
  , ppLayout  = (\layout -> case layout of
      "Tall"        -> "[|]"
      "Mirror Tall" -> "[-]"
      "ThreeCol"    -> "[||]"
      "Tabbed"      -> "[_]"
      "Gimp"        -> "[&]"
      )
  }
    where
    currentStyle = xmobarColor "#A3BE8C" "" -- . wrap "(" ")"
    visibleStyle = xmobarColor "#4C566A" ""  -- color of inactive workspace visibleStyle = wrap "(" ")"
    titleStyle   = xmobarColor "#5E81AC" "" . shorten 100 . filterCurly
    filterCurly  = filter (not . isCurly)
    isCurly x    = x == '{' || x == '}'

------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.

-- Run xmonad with the settings you specify. No need to modify this.
--
-- main = xmonad =<< statusBar "xmobar" myPP toggleStrutsKey (ewmh defaults)
-- Read somewhere that this may be more appropriate.
main = xmonad . ewmh =<< statusBar "xmobar" myPP toggleStrutsKey defaults
toggleStrutsKey XConfig { XMonad.modMask = modMask } = (modMask, xK_b)

-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- use the defaults defined in xmonad/XMonad/Config.hs
--
-- No need to modify this.
--
defaults = def {
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        clickJustFocuses   = myClickJustFocuses,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

      -- key bindings
        keys               = myKeys,
        mouseBindings      = myMouseBindings,

      -- hooks, layouts
        layoutHook         = myLayout,
        manageHook         = myManageHook <+> namedScratchpadManageHook myScratchPads,
        handleEventHook    = myEventHook,
        logHook            = myLogHook,
        startupHook        = myStartupHook
    }

-- | They keybindings for this config file, accessible via mod-Shift-/
help :: String
help = unlines
   [ "XMonad keybindings help"
   , ""
   , "The modifier key is 'super'. Keybindings:"
   , ""
   , "-- launching and killing programs"
   , "mod-Shift-Enter  Launch " ++ myTerminal
   , "mod-p            Launch shell prompt"
   , "mod-Shift-p      Launch gmrun"
   , "mod-Shift-c      Close/kill the focused window"
   , "mod-Space        Rotate through the available layout algorithms"
   , "mod-Shift-Space  Reset the layouts on the current workSpace to default"
   , "mod-n            Resize/refresh viewed windows to the correct size"
   , "mod-Shift-l      Lock workstation with xscreensaver"
   , ""
   , "-- move focus up or down the window stack"
   , "mod-Tab        Move focus to the next window"
   , "mod-Shift-Tab  Move focus to the previous window"
   , "mod-j          Move focus to the next window"
   , "mod-k          Move focus to the previous window"
   , "mod-m          Move focus to the master window"
   , ""
   , "-- modifying the window order"
   , "mod-Return   Swap the focused window and the master window"
   , "mod-Shift-j  Swap the focused window with the next window"
   , "mod-Shift-k  Swap the focused window with the previous window"
   , ""
   , "-- resizing the master/slave ratio"
   , "mod-h  Shrink the master area"
   , "mod-l  Expand the master area"
   , ""
   , "-- floating layer support"
   , "mod-t  Push window back into tiling; unfloat and re-tile it"
   , ""
   , "-- increase or decrease number of windows in the master area"
   , "mod-comma  (mod-,)  Increment the number of windows in the master area"
   , "mod-period (mod-.)  Deincrement the number of windows in the master area"
   , ""
   , "-- quit, or restart"
   , "mod-Shift-q  Quit xmonad"
   , "mod-q        Restart xmonad"
   , ""
   , "-- Workspaces & screens"
   , "mod-[1..9]         Switch to workSpace N"
   , "mod-Shift-[1..9]   Move client to workspace N"
   , "mod-{w,e,r}        Switch to physical/Xinerama screens 1, 2, or 3"
   , "mod-Shift-{w,e,r}  Move client to screen 1, 2, or 3"
   , ""
   , "-- Mouse bindings: default actions bound to mouse events"
   , "mod-button1  Set the window to floating mode and move by dragging"
   , "mod-button2  Raise the window to the top of the stack"
   , "mod-button3  Set the window to floating mode and resize by dragging"
   , ""
   , "-- Miscellaneous bindings"
   , "mod-b                Toggle the status bar gap"
   , "mod-Shift-/ (mod-?)  Show this help dialog"
   ]
