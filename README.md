# Oracle Linux 7 STIG Manual Checks
This is a collection of scripts that help to automate the process of performing the checks on STIG items left over from using the SCAP scanning tool. 

###### Updated for STIG Version 1 Release 2 and SCAP Version 1 Release 2, July 24, 2020

## Installation
Download the latest package file and extract. Copy all files and folders to your jump server, if you have one. 

## Usage
If you have Ansible, use the supplied .yml file to push stig_checks.zip to your systems, run the scan, and pull back the results. Or you can copy stig_checks.zip to the server you want to check, extract, and run stig_check.sh. Once you have the results file, in .ckl format. Import it into an existing STIG checklist.

## File Descriptions
- stig_checks.sh - Loops through the shell scripts in the rules folder and populates the base checklist with STIG check results.
- ~ManualChecks.ckl - The base checklist. The STIG checklist rules leftover from subtracting a SCAP profile from a STIG checklist.
- tools/Create-ManualChecklistFile.ps1 - A Powershell script that subtracts a SCAP profile from a STIG checklist to create our ~ManuaChecks.ckl file.
- *ansible_push_stig_checks.yml - (Optional) An Ansible playbook that pushes the rules folder, stig_checks.sh, and ~ManualChecks.ckl to the server(s) to be checked, executes the scripts, and pulls back the results. 

## CHANGES for this version
- V-99165, V-99539 - Updated Group ID.
- V-99295, V-99297, V-99299, V-99301, V-99303, V-99305, V-99307, V-99309, V-99311, V-99313, V-99315, V-99317, V-99319, V-99321, V-99323, V-99325, V-99327, V-99329, V-99331, V-99333, V-99335, V-99337, V-99339, V-99345, V-99347, V-99349, V-99351, V-99353, V-99355, V-99357, V-99361, V-99363, V-99365, V-99367, V-99369, V-99371, V-99373, V-99375, V-99377, V-99387, V-99399, V-99401, V-99403, V-99405, V-99407 - Updated Vulnerability Discussionwith information about "auid". Updated theCheck Content and Fix Text for "auid!".

## Includes shell scripts for the following rules
- SV-108149r1_rule - V-99045 - The Oracle Linux operating system must be configured so that the file permissions, ownership, and group membership of system files and commands match the vendor values.
- SV-108155r1_rule - V-99051 - The Oracle Linux operating system must display the approved Standard Mandatory DoD Notice and Consent Banner before granting local or remote access to the system via a graphical user logon.
- SV-108157r1_rule - V-99053 - The Oracle Linux operating system must display the Standard Mandatory DoD Notice and Consent Banner before granting local or remote access to the system via a command line user logon.
- SV-108163r1_rule - V-99059 - The Oracle Linux operating system must prevent a user from overriding the screensaver lock-enabled setting for the graphical user interface.
- SV-108169r1_rule - V-99065 - The Oracle Linux operating system must prevent a user from overriding the session idle-delay setting for the graphical user interface.
- SV-108223r1_rule - V-99119 - Accounts on the Oracle Linux operating system subjected to three unsuccessful logon attempts within 15 minutes must be locked for the maximum configurable period.
- SV-108225r1_rule - V-99121 - The Oracle Linux operating system must lock the associated account after three unsuccessful root logon attempts are made within a 15-minute period.
- SV-108249r1_rule - V-99145 - The Oracle Linux operating system must uniquely identify and must authenticate organizational users (or processes acting on behalf of organizational users) using multifactor authentication.
- SV-108255r1_rule - V-99151 - The Oracle Linux operating system must have a host-based intrusion detection tool installed.
- SV-108257r1_rule - V-99153 - The Oracle Linux operating system must prevent non-privileged users from executing privileged functions to include disabling, circumventing, or altering implemented security safeguards/countermeasures.
- SV-108261r1_rule - V-99157 - The Oracle Linux operating system must be configured so that designated personnel are notified if baseline configurations are changed in an unauthorized manner.
- SV-108275r1_rule - V-99171 - The Oracle Linux operating system must be configured so that the x86 Ctrl-Alt-Delete key sequence is disabled.
- SV-108281r1_rule - V-99177 - The Oracle Linux operating system security patches and updates must be installed and up to date.
- SV-108283r1_rule - V-99179 - The Oracle Linux operating system must not have unnecessary accounts.
- SV-108291r1_rule - V-99187 - The Oracle Linux operating system must be configured so that all files and directories have a valid owner.
- SV-108293r1_rule - V-99189 - The Oracle Linux operating system must be configured so that all files and directories have a valid group owner.
- SV-108301r1_rule - V-99197 - The Oracle Linux operating system must be configured so that all local interactive user home directories have mode 0750 or less permissive.
- SV-108303r1_rule - V-99199 - The Oracle Linux operating system must be configured so that all local interactive user home directories are owned by their respective users.
- SV-108305r1_rule - V-99201 - The Oracle Linux operating system must be configured so that all local interactive user home directories are group-owned by the home directory owners primary group.
- SV-108307r1_rule - V-99203 - The Oracle Linux operating system must be configured so that all files and directories contained in local interactive user home directories are owned by the owner of the home directory.
- SV-108309r1_rule - V-99205 - The Oracle Linux operating system must be configured so that all files and directories contained in local interactive user home directories are group-owned by a group of which the home directory owner is a member.
- SV-108311r1_rule - V-99207 - The Oracle Linux operating system must be configured so that all files and directories contained in local interactive user home directories have a mode of 0750 or less permissive.
- SV-108313r1_rule - V-99209 - The Oracle Linux operating system must be configured so that all local initialization files for interactive users are owned by the home directory user or root.
- SV-108315r1_rule - V-99211 - The Oracle Linux operating system must be configured so that all local initialization files for local interactive users are be group-owned by the users primary group or root.
- SV-108317r1_rule - V-99213 - The Oracle Linux operating system must be configured so that all local initialization files have mode 0740 or less permissive.
- SV-108319r1_rule - V-99215 - The Oracle Linux operating system must be configured so that all local interactive user initialization files executable search paths contain only paths that resolve to the users home directory.
- SV-108321r1_rule - V-99217 - The Oracle Linux operating system must be configured so that local initialization files do not execute world-writable programs.
- SV-108323r1_rule - V-99219 - The Oracle Linux operating system must be configured so that all system device files are correctly labeled to prevent unauthorized modification.
- SV-108325r1_rule - V-99221 - The Oracle Linux operating system must be configured so that file systems containing user home directories are mounted to prevent files with the setuid and setgid bit set from being executed.
- SV-108327r1_rule - V-99223 - The Oracle Linux operating system must prevent files with the setuid and setgid bit set from being executed on file systems that are used with removable media.
- SV-108333r1_rule - V-99229 - The Oracle Linux operating system must mount /dev/shm with the nodev option.
- SV-108335r1_rule - V-99231 - The Oracle Linux operating system must mount /dev/shm with the nosuid option.
- SV-108337r1_rule - V-99233 - The Oracle Linux operating system must mount /dev/shm with the noexec option.
- SV-108341r1_rule - V-99237 - The Oracle Linux operating system must set the umask value to 077 for all local interactive user accounts.
- SV-108343r1_rule - V-99239 - The Oracle Linux operating system must have cron logging implemented.
- SV-108349r1_rule - V-99245 - The Oracle Linux operating system must disable Kernel core dumps unless needed.
- SV-108355r1_rule - V-99251 - The Oracle Linux operating system must use a separate file system for the system audit data path large enough to hold at least one week of audit data.
- SV-108361r1_rule - V-99257 - The Oracle Linux operating system must be configured so that the file integrity tool is configured to verify Access Control Lists (ACLs).
- SV-108363r1_rule - V-99259 - The Oracle Linux operating system must be configured so that the file integrity tool is configured to verify extended attributes.
- SV-108365r1_rule - V-99261 - The Oracle Linux operating system must use a file integrity tool that is configured to use FIPS 140-2 approved cryptographic hashes for validating file contents and directories.
- SV-108367r1_rule - V-99263 - The Oracle Linux operating system must not allow removable media to be used as the boot loader unless approved.
- SV-108391r1_rule - V-99287 - The Oracle Linux operating system must initiate an action to notify the System Administrator (SA) and Information System Security Officer (ISSO), at a minimum, when allocated audit record storage volume reaches 75 percent of the repository maximum audit record storage capacity.
- SV-108513r1_rule - V-99409 - The Oracle Linux operating system must send rsyslog output to a log aggregation server.
- SV-108515r1_rule - V-99411 - The Oracle Linux operating system must be configured so that the rsyslog daemon does not accept log messages from other servers unless the server is being used for log aggregation.
- SV-108517r1_rule - V-99413 - The Oracle Linux operating system must use a virus scan program.
- SV-108521r1_rule - V-99417 - The Oracle Linux operating system must be configured to prohibit or restrict the use of functions, ports, protocols, and/or services, as defined in the Ports, Protocols, and Services Management Component Local Service Assessment (PPSM CLSA) and vulnerability assessments.
- SV-108525r1_rule - V-99421 - The Oracle Linux operating system must be configured so that all network connections associated with a communication session are terminated at the end of the session or after 10 minutes of inactivity from the user at a command prompt, except to fulfill documented and validated mission requirements.
- SV-108527r1_rule - V-99423 - The Oracle Linux operating system must display the Standard Mandatory DoD Notice and Consent Banner immediately prior to, or as part of, remote access logon prompts.
- SV-108529r1_rule - V-99425 - The Oracle Linux operating system must implement cryptography to protect the integrity of Lightweight Directory Access Protocol (LDAP) authentication communications.
- SV-108531r1_rule - V-99427 - The Oracle Linux operating system must implement cryptography to protect the integrity of Lightweight Directory Access Protocol (LDAP) communications.
- SV-108533r1_rule - V-99429 - The Oracle Linux operating system must implement cryptography to protect the integrity of Lightweight Directory Access Protocol (LDAP) communications.
- SV-108539r1_rule - V-99435 - The Oracle Linux operating system must be configured so that all networked systems use SSH for confidentiality and integrity of transmitted and received information as well as information during preparation for transmission.
- SV-108573r1_rule - V-99469 - The operating system must request and perform data origin authentication verification and data integrity verification on the name/address resolution responses the system receives from authoritative sources.
- SV-108575r1_rule - V-99471 - The Oracle Linux operating system must, for networked systems, synchronize clocks with a server that is synchronized to one of the redundant United States Naval Observatory (USNO) time servers, a time server designated for the appropriate DoD network (NIPRNet/SIPRNet), and/or the Global Positioning System (GPS).
- SV-108577r1_rule - V-99473 - The Oracle Linux operating system must protect against or limit the effects of Denial of Service (DoS) attacks by validating the operating system is implementing rate-limiting measures on impacted network interfaces.
- SV-108579r1_rule - V-99475 - The Oracle Linux operating system must enable an application firewall, if available.
- SV-108591r1_rule - V-99487 - The Oracle Linux operating system must use a reverse-path filter for IPv4 network traffic when possible on all interfaces.
- SV-108593r1_rule - V-99489 - The Oracle Linux operating system must use a reverse-path filter for IPv4 network traffic when possible by default.
- SV-108607r1_rule - V-99503 - Network interfaces configured on The Oracle Linux operating system must not be in promiscuous mode.
- SV-108609r1_rule - V-99505 - The Oracle Linux operating system must be configured to prevent unrestricted mail relaying.
- SV-108617r1_rule - V-99513 - The Oracle Linux operating system must be configured so that if the Trivial File Transfer Protocol (TFTP) server is required, the TFTP daemon is configured to operate in secure mode.
- SV-108623r1_rule - V-99519 - The Oracle Linux operating system must be configured so that the Network File System (NFS) is configured to use RPCSEC_GSS.
- SV-108627r1_rule - V-99523 - The Oracle Linux operating system access control program must be configured to grant or deny system access to specific hosts and services.
- SV-108629r1_rule - V-99525 - The Oracle Linux operating system must not have unauthorized IP tunnels configured.
- SV-108639r1_rule - V-99535 - The Oracle Linux operating system must be configured so that all wireless network adapters are disabled.
- SV-108641r1_rule - V-99537 - The Oracle Linux operating system must protect audit information from unauthorized read, modification, or deletion.
- SV-108643r2_rule - V-99539 - The Oracle Linux operating system must enable SELinux.
- SV-108735r1_rule - V-99631 - The Oracle Linux operating system must be integrated into a directory service infrastructure.
