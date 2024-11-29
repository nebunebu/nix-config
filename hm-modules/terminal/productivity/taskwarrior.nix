{ lib
, config
, pkgs
, ...
}:
let
  cfg = config.neb.terminal.productivity.taskwarrior;
in
{
  options = {
    neb.terminal.productivity.taskwarrior.enable = lib.mkEnableOption "enable taskwarrior";
  };
  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.taskwarrior-tui ];
    programs = {
      taskwarrior = {
        enable = true;
        config = {
          color = "on";
          rule.precedence.color = "deleted,completed,active,keyword.,tag.,project.,overdue,scheduled,due.today,due,blocked,blocking,recurring,tagged,uda.";
        };

        # base00: "#191724" color0
        # base01: "#1f1d2e" color10
        # base02: "#26233a" color11
        # base03: "#6e6a86" color12
        # base04: "#908caa" color8
        # base05: "#e0def4" color7
        # base06: "#e0def4" color13
        # base07: "#524f67" color14
        # base08: "#eb6f92" color1
        # base09: "#f6c177" color5
        # base0A: "#ebbcba" color3
        # base0B: "#31748f" color2
        # base0C: "#9ccfd8" color6
        # base0D: "#c4a7e7" color4
        # base0E: "#f6c177" color9
        # base0F: "#524f67" color15

        extraConfig = /* ini */ ''
          # General decoration
          color.label=color7 on color0          # base05 on base00: Light text on dark background
          color.label.sort=color8               # base04: Muted sort indicators
          color.alternate=on color10            # base01: Alternate row background
          color.header=color8                   # base04: Headers
          color.footnote=color8                 # base04: Footnotes
          color.warning=color5                  # base09: Warning messages
          color.error=color1                    # base08: Error messages
          color.debug=color6                    # base0C: Debug information

          # Task state
          color.completed=color14               # base07: Completed tasks (muted)
          color.deleted=color14                 # base07: Deleted tasks (muted)
          color.active=bold color1              # base08: Active tasks
          color.recurring=color4                # base0D: Recurring tasks
          color.scheduled=color6                # base0C: Scheduled tasks
          color.until=color6                    # base0C: Until date
          color.blocked=color3                  # base0A: Blocked tasks
          color.blocking=bold color3            # base0A: Blocking tasks

          # Project
          color.project.none=color7             # base05: No project assigned

          # Priority
          color.uda.priority.H=bold color1      # base08: High priority
          color.uda.priority.M=color5           # base09: Medium priority
          color.uda.priority.L=color8           # base04: Low priority

          # Tags
          color.tag.next=color6                 # base0C: Next actions
          color.tag.none=color7                 # base05: No tags
          color.tagged=color4                   # base0D: Tagged items

          # Due
          color.due=color6                      # base0C: Due tasks
          color.due.today=color1                # base08: Tasks due today
          color.overdue=bold color1             # base08: Overdue tasks

          # Report: burndown
          color.burndown.done=color14           # base07: Done tasks in burndown
          color.burndown.pending=color5         # base09: Pending tasks
          color.burndown.started=color1         # base08: Started tasks

          # Report: history
          color.history.add=color6              # base0C: Added items
          color.history.delete=color1           # base08: Deleted items
          color.history.done=color14            # base07: Completed items

          # Report: summary
          color.summary.background=on color0    # base00: Summary background
          color.summary.bar=color4 on color8    # base0D on base04: Progress bar

          # Command: calendar
          color.calendar.due=color6             # base0C: Due dates
          color.calendar.due.today=color1       # base08: Due today
          color.calendar.holiday=color1         # base08: Holidays
          color.calendar.overdue=bold color1    # base08: Overdue
          color.calendar.scheduled=color6       # base0C: Scheduled items
          color.calendar.today=bold color6      # base0C: Today
          color.calendar.weekend=color8         # base04: Weekends
          color.calendar.weeknumber=color8      # base04: Week numbers

          # Command: sync
          color.sync.added=color6               # base0C: Added in sync
          color.sync.changed=color5             # base09: Changed in sync
          color.sync.rejected=color1            # base08: Rejected in sync

          # Command: undo
          color.undo.after=color6               # base0C: After state
          color.undo.before=color1              # base08: Before state
        '';
      };
      zsh.shellAliases = {
        tadd = "task add +capture";
        taskt = "taskwarrior-tui";
      };
    };
  };
}
