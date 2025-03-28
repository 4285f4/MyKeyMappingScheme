; ==============================================================================
; AutoHotkey v2 CapsLock Remapping Script
; AutoHotkey v2 CapsLock 重映射脚本
; ==============================================================================
; Purpose: Remap CapsLock to act as a modifier key for navigation, editing,
;          function keys, numpad simulation, etc., while retaining the ability
;          to toggle CapsLock state via CapsLock+Tab and send Esc on standalone press.
; 目的: 将 CapsLock 重映射为一个修饰键，用于导航、编辑、功能键、小键盘模拟等，
;       同时保留通过 CapsLock+Tab 切换 CapsLock 状态以及单独按下时发送 Esc 的能力。
; ==============================================================================

; === Script Configuration ===
; === 脚本配置 ===
#Requires AutoHotkey v2.0      ; Ensure v2 compatibility / 确保 v2 兼容性
#SingleInstance Force          ; Allow only one instance / 只允许一个实例运行
SetCapsLockState "AlwaysOff"   ; Disable built-in CapsLock toggle functionality / 禁用内置的 CapsLock 切换功能


; === Standalone CapsLock Behavior (Send Esc) ===
; === 单独按下 CapsLock 的行为 (发送 Esc) ===
; If CapsLock is pressed and released without triggering a combo, send Esc.
; 如果 CapsLock 被按下并释放，且没有触发组合键，则发送 Esc。
; The ~ prefix allows CapsLock's physical press/release events to pass through,
; ~ 前缀允许 CapsLock 的物理按下/释放事件传递，
; which is necessary for it to function correctly as a modifier key below.
; 这对于使其在下面正确地作为修饰键工作是必要的。
~CapsLock::
{
    ; Wait for CapsLock release, timeout after 0.2 seconds (T0.2)
    ; 等待 CapsLock 释放，超时时间 0.2 秒 (T0.2)
    ; A_PriorKey check ensures no other key was pressed between CapsLock Down/Up
    ; A_PriorKey 检查确保在 CapsLock 按下和抬起之间没有按下其他键
    if KeyWait("CapsLock", "T0.2") && A_PriorKey == "CapsLock"
        Send "{Esc}"
    ; Always wait for the physical release, regardless of timeout or PriorKey
    ; 无论是否超时或 A_PriorKey 如何，始终等待物理按键释放
    KeyWait("CapsLock")
}


; ==============================================================================
; === CapsLock Modifier Hotkeys ===
; === CapsLock 修饰键热键 ===
; ==============================================================================
; Note on {Blind}{Down/Up}:
; 关于 {Blind}{Down/Up} 的说明:
; Using {Blind} ensures that simultaneously pressed physical modifier keys
; 使用 {Blind} 确保同时按下的物理修饰键
; (Shift, Ctrl, Alt) are correctly combined with the sent key (e.g., Home, Up).
; (Shift, Ctrl, Alt) 能与发送的按键 (例如 Home, Up) 正确组合。
; Separating Down and Up events allows holding the key (e.g., holding Caps+W
; 分离 Down 和 Up 事件允许按住键 (例如，按住 Caps+W
; should behave like holding the Up arrow).
; 应该像按住向上箭头一样)。

; --- Navigation ---
; --- 导航 ---
CapsLock & w::SendInput "{Blind}{Up Down}"      ; Caps + W = Up Arrow / 向上箭头
CapsLock & w Up::SendInput "{Blind}{Up Up}"

CapsLock & s::SendInput "{Blind}{Down Down}"    ; Caps + S = Down Arrow / 向下箭头
CapsLock & s Up::SendInput "{Blind}{Down Up}"

CapsLock & a::SendInput "{Blind}{Left Down}"    ; Caps + A = Left Arrow / 向左箭头
CapsLock & a Up::SendInput "{Blind}{Left Up}"

CapsLock & d::SendInput "{Blind}{Right Down}"   ; Caps + D = Right Arrow / 向右箭头
CapsLock & d Up::SendInput "{Blind}{Right Up}"

CapsLock & [::SendInput "{Blind}{Home Down}"    ; Caps + [ = Home
CapsLock & [ Up::SendInput "{Blind}{Home Up}"

CapsLock & ]::SendInput "{Blind}{End Down}"     ; Caps + ] = End
CapsLock & ] Up::SendInput "{Blind}{End Up}"


; --- Editing & Programming Keys ---
; --- 编辑与编程键 ---
CapsLock & /::SendInput "{Blind}{Delete Down}"  ; Caps + / = Delete / 删除
CapsLock & / Up::SendInput "{Blind}{Delete Up}"

CapsLock & `;::SendInput "{Blind}{Insert Down}"  ; Caps + ; = Insert / 插入
CapsLock & `; Up::SendInput "{Blind}{Insert Up}"


; --- Function Keys (F1-F12) ---
; --- 功能键 (F1-F12) ---
; These usually don't need {Blind} or Down/Up unless specific Shift/Ctrl/Alt
; 这些通常不需要 {Blind} 或 Down/Up，除非特定的 Shift/Ctrl/Alt
; combinations with F-keys are frequently required and need holding behavior.
; 与 F 键的组合经常需要并且需要按住行为。
CapsLock & 1::Send "{F1}"
CapsLock & 2::Send "{F2}"
CapsLock & 3::Send "{F3}"
CapsLock & 4::Send "{F4}"
CapsLock & 5::Send "{F5}"
CapsLock & 6::Send "{F6}"
CapsLock & 7::Send "{F7}"
CapsLock & 8::Send "{F8}"
CapsLock & 9::Send "{F9}"
CapsLock & 0::Send "{F10}"
CapsLock & -::Send "{F11}" ; Hyphen/Minus key / 连字符/减号键
CapsLock & =::Send "{F12}" ; Equals key / 等号键


; --- Numpad Simulation ---
; --- 模拟小键盘 ---
; Similar to F-keys, usually simple Send is sufficient.
; 与 F 键类似，通常简单的 Send 就足够了。
CapsLock & n::Send "1"
CapsLock & m::Send "2"
CapsLock & ,::Send "3"
CapsLock & h::Send "4"
CapsLock & j::Send "5"
CapsLock & k::Send "6"
CapsLock & y::Send "7"
CapsLock & u::Send "8"
CapsLock & i::Send "9"
CapsLock & Space::Send "0"


; --- Utility Keys ---
; --- 功能/工具键 ---
; Using {Blind}{Down/Up} for compatibility with Alt+PrtScn (via Alt+Caps+P).
; 使用 {Blind}{Down/Up} 以兼容 Alt+PrtScn (通过 Alt+Caps+P 实现)。
CapsLock & p::SendInput "{Blind}{PrintScreen Down}" ; Caps + p = PrintScreen / 打印屏幕
CapsLock & p Up::SendInput "{Blind}{PrintScreen Up}"


; --- CapsLock State Control ---
; --- CapsLock 状态控制 ---
; Allow manually toggling the actual CapsLock state via CapsLock + Tab
; 允许通过 CapsLock + Tab 手动切换实际的 CapsLock 状态
CapsLock & Tab::
{
    ; Check if state is logically ON (Toggled)
    ; 检查状态是否逻辑上为 ON (Toggled)
    if GetKeyState("CapsLock", "T")
        SetCapsLockState "AlwaysOff" ; If ON, turn OFF / 如果 ON，则关闭
    else
        SetCapsLockState "AlwaysOn"  ; If OFF, turn ON / 如果 OFF，则开启
}


; ==============================================================================
; === Script Management ===
; === 脚本管理 ===
; ==============================================================================

; --- Exit Hotkey ---
; --- 退出热键 ---
^+`::ExitApp() ; Ctrl + Shift + Grave Accent (`) to exit the script / Ctrl + Shift + 重音符 (`) 退出脚本

; ==============================================================================
; === End of Script ===
; === 脚本结束 ===
; ==============================================================================