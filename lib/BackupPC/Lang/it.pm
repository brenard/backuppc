#!/usr/bin/perl
#
# $Id$
#
# Italian i18n file
#
# (C)  Lorenzo Cappelletti <lorenzo.cappelletti@email.it>  2004
#


# --------------------------------

$Lang{Start_Archive} = "Avvia archivio";
$Lang{Stop_Dequeue_Archive} = "Arresta/disaccoda archivio";
$Lang{Start_Full_Backup} = "Avvia backup completo";
$Lang{Start_Incr_Backup} = "Avvia backup incrementale";
$Lang{Stop_Dequeue_Backup} = "Arresta/disaccoda backup";
$Lang{Restore} = "Ripristina";

$Lang{Type_full} = "completo";
$Lang{Type_incr} = "incrementale";

# -----

$Lang{Only_privileged_users_can_view_admin_options} = "Solo gli utenti privilegiati possono visualizzare le opzioni di amministrazione.";
$Lang{H_Admin_Options} = "Server BackupPC: opzioni di amministrazione";
$Lang{Admin_Options} = "Opzioni di amministrazione";
$Lang{Admin_Options_Page} = <<EOF;
\${h1(qq{$Lang{Admin_Options}})}
<br>
\${h1("Controllo server")}
<form action="\$MyURL" method="get">
<table>
  <tr><td>Arresta il server:<td><input type="submit" name="action" value="Stop">
  <tr><td>Ricarica la configurazione del server:<td><input type="submit" name="action" value="Reload">
</table>
</form>
\${h1("Configurazione server")}
<ul>
  <li><i>Other options can go here... e.g.,</i>
  <li>Modifica configurazione server
</ul>
EOF
$Lang{Unable_to_connect_to_BackupPC_server} = "Impossibile connettersi al server BackupPC",
            "Questo script CGI (\$MyURL) non &egrave; in grado di connettersi al server"
          . " BackupPC su \$Conf{ServerHost} alla porta \$Conf{ServerPort}.  L'errore &egrave;:"
          . " \$err.",
            "Forse il server BackupPC non &egrave; in esecuzioneor c'&egrave; un errore"
          . " nella configurazione.  Contattare l'amministratore di sistema.";
$Lang{Admin_Start_Server} = <<EOF;
\${h1(qq{$Lang{Unable_to_connect_to_BackupPC_server}})}
<form action="\$MyURL" method="get">
Il server BackupPC presso <tt>\$Conf{ServerHost}</tt> sulla porta <tt>\$Conf{ServerPort}</tt>
non &egrave; attualmente in esecuzione (forse &egrave; stato arrestato oppure non &egrave; stato ancora avviato).<br>
Si desidera avviarlo?
<input type="hidden" name="action" value="startServer">
<input type="submit" value="Avvia server" name="ignore">
</form>
EOF

# -----

$Lang{H_BackupPC_Server_Status} = "Stato server BackupPC";

$Lang{BackupPC_Server_Status}= <<EOF;
\${h1(qq{$Lang{H_BackupPC_Server_Status}})}

<p>
\${h2("Informazioni generali server")}

<ul>
<li>Il PID del server &egrave; \$Info{pid} sull\'host \$Conf{ServerHost},
    versione \$Info{Version}, avviato il \$serverStartTime.
<li>Questo rapporto di stato &egrave; stato generato il \$now.
<li>La configurazione &egrave; stata caricata l'ultima volte il \$configLoadTime.
<li>Il prossimo accodamento dei PC sar&agrave; effettuato il \$nextWakeupTime.
<li>Altre informazioni:
    <ul>
        <li>\$numBgQueue richieste pendenti di backup dall\'ultimo risveglio
            programmato
        <li>\$numUserQueue richieste pendenti di backup da parte degli utenti
        <li>\$numCmdQueue richieste pendenti di comandi
        \$poolInfo
        <li>Recentemente il sistema dei file di pool &egrave; stato al
            \$Info{DUlastValue}% (\$DUlastTime).  Il massimo di oggi
            &egrave; del \$Info{DUDailyMax}% (\$DUmaxTime), mentre quello
            di ieri era del \$Info{DUDailyMaxPrev}%.
    </ul>
</ul>

\${h2("Processi attualmente in esecuzione")}
<p>
<table class="tableStnd" border cellspacing="1" cellpadding="3">
<tr class="tableheader"><td> Host </td>
    <td> Tipo </td>
    <td> Utente </td>
    <td> Data inizio </td>
    <td> Comando </td>
    <td align="center"> PID </td>
    <td align="center"> PID Xfer </td>
    </tr>
\$jobStr
</table>
<p>

\${h2("Fallimenti che richiedono attenzione")}
<p>
<table class="tableStnd" border cellspacing="1" cellpadding="3">
<tr class="tableheader"><td align="center"> Host </td>
    <td align="center"> Tipo </td>
    <td align="center"> Utente </td>
    <td align="center"> Ultimo tentativo </td>
    <td align="center"> Dettagli </td>
    <td align="center"> Data errore </td>
    <td> Ultimo errore (diverso da ping) </td></tr>
\$statusStr
</table>
EOF

# --------------------------------
$Lang{BackupPC__Server_Summary} = "BackupPC: prospetto server";
+$Lang{BackupPC__Archive} = "BackupPC: Archive";
+$Lang{BackupPC_Summary} = <<EOF;

\${h1(qq{$Lang{BackupPC__Server_Summary}})}
<p>
Questo rapporto di stato &egrave; stato generato il \$now.
<p>

\${h2("Host con backup buoni")}
<p>
Ci sono \$hostCntGood host sottoposti a backup per un totale di:
<ul>
<li> \$fullTot backup completi per una dimensione toatle di \${fullSizeTot}GB
     (prima del processo di pooling e compressione),
<li> \$incrTot backup incrementali per una dimensione totale di \${incrSizeTot}GB
     (prima del processo di pooling e compressione).
</ul>
<table border>
<tr><td> Host </td>
    <td align="center"> Utente </td>
    <td align="center"> Completi </td>
    <td align="center"> Et&agrave; completi<br>(giorni) </td>
    <td align="center"> Dimensione completi<br>(GB) </td>
    <td align="center"> Velocit&agrave<br>(MB/s) </td>
    <td align="center"> Incrementali </td>
    <td align="center"> Et&agrave; incrementali<br>(giorni) </td>
    <td align="center"> Stato </td>
    <td align="center"> Ultimo tentativo </td></tr>
\$strGood
</table>
<br><br>
\${h2("Host senza backup")}
<p>
Ci sono \$hostCntNone host senza alcun backup.
<p>
<table class="tableStnd" border cellpadding="3" cellspacing="1">
<tr class="tableheader"><td> Host </td>
    <td align="center"> Utente </td>
    <td align="center"> Completi </td>
    <td align="center"> Et&agrave; completi<br>(giorni) </td>
    <td align="center"> Dimensione completi<br>(GB) </td>
    <td align="center"> Velocit&agrave<br>(MB/s) </td>
    <td align="center"> Incrementali </td>
    <td align="center"> Et&agrave; incrementali<br>(giorni) </td>
    <td align="center"> Stato </td>
    <td align="center"> Ultimo tentativo </td></tr>
\$strNone
</table>
EOF

$Lang{BackupPC_Archive} = <<EOF;
\${h1(qq{$Lang{BackupPC__Archive}})}
<script language="javascript" type="text/javascript">
<!--

    function checkAll(location)
    {
      for (var i=0;i<document.form1.elements.length;i++)
      {
        var e = document.form1.elements[i];
        if ((e.checked || !e.checked) && e.name != \'all\') {
            if (eval("document.form1."+location+".checked")) {
                e.checked = true;
            } else {
                e.checked = false;
            }
        }
      }
    }

    function toggleThis(checkbox)
    {
       var cb = eval("document.form1."+checkbox);
       cb.checked = !cb.checked;
    }

//-->
</script>

&Egrave; stato effettuato il backup di \$hostCntGood host per una dimensione
totale di \${fullSizeTot}GB
<p>
<form name="form1" method="post" action="\$MyURL">
<input type="hidden" name="fcbMax" value="\$checkBoxCnt">
<input type="hidden" name="type" value="1">
<input type="hidden" name="host" value="\${EscHTML(\$archHost)}">
<input type="hidden" name="action" value="Archive">
<table class="tableStnd" border cellpadding="3" cellspacing="1">
<tr class="tableheader"><td align=center> Host</td>
    <td align="center"> Utente </td>
    <td align="center"> Dimensione<br>backup </td>
\$strGood
\$checkAllHosts
</table>
</form>
<p>

EOF

$Lang{BackupPC_Archive2} = <<EOF;
\${h1(qq{$Lang{BackupPC__Archive}})}
Gli host seguenti stanno per esseri archiviati
<ul>
\$HostListStr
</ul>
<form action="\$MyURL" method="post">
\$hiddenStr
<input type="hidden" name="action" value="Archive">
<input type="hidden" name="host" value="\${EscHTML(\$archHost)}">
<input type="hidden" name="type" value="2">
<input type="hidden" value="0" name="archive_type">
<table class="tableStnd" border cellspacing="1" cellpadding="3">
\$paramStr
<tr>
    <td colspan=2><input type="submit" value="Avvia archiviazione" name=""></td>
</tr>
</form>
</table>
EOF

$Lang{BackupPC_Archive2_location} = <<EOF;
<tr>
    <td>Localizzazione archivio/dispositivi</td>
    <td><input type="text" value="\$ArchiveDest" name="archive_device"></td>
</tr>
EOF

$Lang{BackupPC_Archive2_compression} = <<EOF;
<tr>
    <td>Compressione</td>
    <td>
    <input type="radio" value="0" name="compression" \$ArchiveCompNone>nessuna<br>
    <input type="radio" value="1" name="compression" \$ArchiveCompGzip>gzip<br>
    <input type="radio" value="2" name="compression" \$ArchiveCompBzip2>bzip2
    </td>
</tr>
EOF

$Lang{BackupPC_Archive2_parity} = <<EOF;
<tr>
    <td>Numero di file di parit&agrave;</td>
    <td><input type="numeric" value="\$ArchivePar" name="par"></td>
</tr>
EOF

$Lang{BackupPC_Archive2_split} = <<EOF;
<tr>
    <td>Suddividi output in</td>
    <td><input type="numeric" value="\$ArchiveSplit" name="splitsize">Megabyte </td>
</tr>
EOF
  
# -----------------------------------
$Lang{Pool_Stat} = <<EOF;
        <li>Il pool di \${poolSize}GB comprende \$info->{"\${name}FileCnt"}
            file e \$info->{"\${name}DirCnt"} directory (al \$poolTime),
        <li>L\'hash del pool d&agrave; \$info->{"\${name}FileCntRep"} file
            ripetuti con la catena pi&ugrave; lunga di \$info->{"\${name}FileRepMax"},
        <li>La pulizia notturna ha rimosso \$info->{"\${name}FileCntRm"}
            file per una dimensione di \${poolRmSize}GB (circa il \$poolTime),
EOF

# --------------------------------
$Lang{BackupPC__Backup_Requested_on__host} = "BackupPC: richiesta di backup per \$host";
# --------------------------------
$Lang{REPLY_FROM_SERVER} = <<EOF;
\${h1(\$str)}
<p>
La risposta del server &grave; stata: \$reply
<p>
Ritorna alla <a href="\$MyURL?host=\$host">homepage di \$host</a>.
EOF
# --------------------------------
$Lang{BackupPC__Start_Backup_Confirm_on__host} = "BackupPC: conferma avvio backup per \$host";
# --------------------------------
$Lang{Are_you_sure_start} = <<EOF;
\${h1("Sicuro?")}
<p>
Si sta per avviare un bakcup \$type per \$host.

<form action="\$MyURL" method="get">
<input type="hidden" name="host" value="\$host">
<input type="hidden" name="hostIP" value="\$ipAddr">
<input type="hidden" name="doit" value="1">
Avviare veramente?
<input type="submit" value="\$In{action}" name="action">
<input type="submit" value="No" name="">
</form>
EOF
# --------------------------------
$Lang{BackupPC__Stop_Backup_Confirm_on__host} = "BackupPC: Conferma di arresto backup per \$host";
# --------------------------------
$Lang{Are_you_sure_stop} = <<EOF;

\${h1("Sicuro?")}

<p>
Si sta per arrestare/disaccodare i backup per \$host;

<form action="\$MyURL" method="get">
<input type="hidden" name="host" value="\$host">
<input type="hidden" name="doit" value="1">
Also, please don\'t start another backup for
<input type="text" name="backoff" size="10" value="\$backoff"> hours.
<p>
Arrestare veramente?
<input type="submit" value="\$In{action}" name="action">
<input type="submit" value="No" name="">
</form>

EOF
# --------------------------------
$Lang{Only_privileged_users_can_view_queues_} = "Solo gli utenti con privilegi possono visualizzare la coda.";
# --------------------------------
$Lang{Only_privileged_users_can_archive} = "Solo gli utenti privilegiati possono archiviare.";
# --------------------------------
$Lang{BackupPC__Queue_Summary} = "BackupPC: Prospetto coda";
# --------------------------------
$Lang{Backup_Queue_Summary} = <<EOF;
\${h1("Prospetto coda di backup")}
<br><br>
\${h2("Prospetto code utenti")}
<p>
Sono state accodate le seguenti richieste degli utenti:
</p>
<table class="tableStnd" border cellspacing="1" cellpadding="3" width="80%">
<tr class="tableheader"><td> Host </td>
    <td> Data richiesta </td>
    <td> Utente </td></tr>
\$strUser
</table>
<br><br>

\${h2("Prospetto code in background")}
<p>
Sono attualmente in coda le seguenti richieste di background:
<table class="tableStnd" border cellspacing="1" cellpadding="3" width="80%">
<tr class="tableheader"><td> Host </td>
    <td> Data richiesta </td>
    <td> Utente </td></tr>
\$strBg
</table>
<br><br>
\${h2("Prospetto coda comandi")}
<p>
Sono attualmente in coda le seguenti richieste di comandi:
<table class="tableStnd" border cellspacing="1" cellpadding="3" width="80%">
<tr class="tableheader"><td> Host </td>
    <td> Data richiesta </td>
    <td> Utente </td>
    <td> Comando </td></tr>
\$strCmd
</table>
EOF

# --------------------------------
$Lang{Backup_PC__Log_File__file} = "BackupPC: file di log \$file";
$Lang{Log_File__file__comment} = <<EOF;
\${h1("File di log \$file \$comment")}
<p>
EOF
# --------------------------------
$Lang{Contents_of_log_file} = <<EOF;
Contenuto del file di log <tt>\$file</tt> modificato il \$mtimeStr \$comment
EOF

# --------------------------------
$Lang{skipped__skipped_lines} = "[ saltate \$skipped righe ]\n";
# --------------------------------
$Lang{_pre___Can_t_open_log_file__file} = "<pre>\nImpossibile aprire il file di log \$file\n";

# --------------------------------
$Lang{BackupPC__Log_File_History} = "BackupPC: cronologia file di log";
$Lang{Log_File_History__hdr} = <<EOF;
\${h1("Cronologia file di log \$hdr")}
<p>
<table class="tableStnd" border cellspacing="1" cellpadding="3" width="80%">
<tr class="tableheader"><td align="center"> File </td>
    <td align="center"> Dimensione </td>
    <td align="center"> Data modifica </td></tr>
\$str
</table>
EOF

# -------------------------------
$Lang{Recent_Email_Summary} = <<EOF;
\${h1("Prospetto email recenti (ordine cronologico inverso)")}
<p>
<table class="tableStnd" border cellspacing="1" cellpadding="3" width="80%">
<tr class="tableheader"><td align="center"> Destinatario </td>
    <td align="center"> Host </td>
    <td align="center"> Data </td>
    <td align="center"> Oggetto </td></tr>
\$str
</table>
EOF
 

# ------------------------------
$Lang{Browse_backup__num_for__host} = "BackupPC: Sfoglia backup \$num per \$host";

# ------------------------------
$Lang{Restore_Options_for__host} = "BackupPC: Opzioni di ripristino per \$host";
$Lang{Restore_Options_for__host2} = <<EOF;
\${h1("Ripristino opzioni per \$host")}
<p>
Sono state selezionate i seguenti file/directory dalla condivisione
\$share, backup numero \$num:
<ul>
\$fileListStr
</ul>
</p><p>
Sono disponibili tre scelte per il ripristino di questi file/directory.
Selezionare una delle opzioni seguenti.
</p>
\${h2("Opzione 1: ripristino diretto")}
<p>
EOF

$Lang{Restore_Options_for__host_Option1} = <<EOF;
&Egrave; possibile avviare un processo che ripristini questi file direttamente
su \$host.
</p><p>
<b>Attenzione:</b> ogni file esistente che corrisponde ai file selezionati
sar&agrave; sovrascritto!

</p>
<form action="\$MyURL" method="post" name="direct">
<input type="hidden" name="host" value="\${EscHTML(\$host)}">
<input type="hidden" name="num" value="\$num">
<input type="hidden" name="type" value="3">
\$hiddenStr
<input type="hidden" value="\$In{action}" name="action">
<table border="0">
<tr>
    <td>Ripristino dei file sull\'host</td>
    <td><!--<input type="text" size="40" value="\${EscHTML(\$host)}"
        name="hostDest">-->
        <select name="hostDest" onChange="document.direct.shareDest.value=''">
        \$hostDestSel
        </select>
        <script language="Javascript">
        function myOpen(URL) {
               window.open(URL,'','width=500,height=400');
        }
        </script>
        <a href="javascript:myOpen('\$MyURL?action=findShares&host='+document.d irect.hostDest.options.value)">Search for available shares (NOT IMPLEMENTED)</a></td>
</tr><tr>
    <td>Ripristino dei file sulla condivisione</td>
    <td><input type="text" size="40" value="\${EscHTML(\$share)}"
	 name="shareDest"></td>
</tr><tr>
    <td>Ripristino dei file al di sotto della directory<br>
        (relativa alla condivisione)</td>
    <td valign="top"><input type="text" size="40" maxlength="256"
	value="\${EscHTML(\$pathHdr)}" name="pathHdr"></td>
</tr><tr>
    <td><input type="submit" value="Avvio ripristino" name=""></td>
</table>
</form>
EOF

$Lang{Restore_Options_for__host_Option1_disabled} = <<EOF;
Direct restore has been disabled for host \${EscHTML(\$hostDest)}.
Please select one of the other restore options.
EOF
  
# ------------------------------
$Lang{Option_2__Download_Zip_archive} = <<EOF;
\${h2("Opzione 2: scaricamento archivio zip")}
<p>
&Egrave; possibile scaricare un archivio zip contenente tutti i
file/directory selezionati.  Sar&agrave; poi possibile usare un applicativo
locale, come WinZip, per  visualizzare o estrarre un file qualsiasi.
</p><p>
<b>Attenzione:</b> a seconda dei file/directory selezionati, l\'archivio
potrebbe essere molto grande.  La creazione ed il trasferimento dell\'archivio
potrebbe richiedere diversi minuti e sar&agrave; necessario disporre di
abbastanza spazio sul proprio disco rigido locale per poterlo contenere.
</p>
<form action="\$MyURL" method="post">
<input type="hidden" name="host" value="\${EscHTML(\$host)}">
<input type="hidden" name="num" value="\$num">
<input type="hidden" name="type" value="2">
\$hiddenStr
<input type="hidden" value="\$In{action}" name="action">
<input type="checkbox" value="1" name="relative" checked> Creare
l\'archivio relativamente a \${EscHTML(\$pathHdr eq "" ? "/" : \$pathHdr)}
(altrimenti l\'archivio conterr&agrave; percorsi completi).
<br>
Compressione (0=off, 1=fast,...,9=best)
<input type="text" size="6" value="5" name="compressLevel">
<br>
<input type="submit" value="Scarica file zip" name="">
</form>
EOF

# ------------------------------

$Lang{Option_2__Download_Zip_archive2} = <<EOF;
<p>
\${h2("Opzione 2: scaricamento archivio zip")}
<p>
Archive::Zip non &egrave; installato e non &egrave; quindi possibile
scaricare un archivio zip.
Contattare l\'amministratore di sistemaper installare Archive::Zip da
a href="http://www.cpan.org">www.cpan.org</a>.
</p>
EOF


# ------------------------------
$Lang{Option_3__Download_Zip_archive} = <<EOF;
\${h2("Opzione 3: Scaricamento archivio tar")}
<p>
&Egrave; possibile scaricare un archivio tar contenente tutti i
file/directory selezionati.  Sar&agrave; poi possibile usare un applicativo
locale, come tar o WinZip, per  visualizzare o estrarre un file qualsiasi.
</p><p>
<b>Attenzione:</b> a seconda dei file/directory selezionati, l\'archivio
potrebbe essere molto grande.  La creazione ed il trasferimento dell\'archivio
potrebbe richiedere diversi minuti e sar&agrave; necessario disporre di
abbastanza spazio sul proprio disco rigido locale per poterlo contenere.
</p>
<form action="\$MyURL" method="post">
<input type="hidden" name="host" value="\${EscHTML(\$host)}">
<input type="hidden" name="num" value="\$num">
<input type="hidden" name="type" value="1">
\$hiddenStr
<input type="hidden" value="\$In{action}" name="action">
<input type="checkbox" value="1" name="relative" checked> Creare
l\'archivio relativamente a \${EscHTML(\$pathHdr eq "" ? "/" : \$pathHdr)}
(altrimenti l\'archivio conterr&agrave; percorsi completi).
<br>
<input type="submit" value="Scarica file tar" name="">
</form>
EOF


# ------------------------------
$Lang{Restore_Confirm_on__host} = "BackupPC: Conferma ripristino su \$host";

$Lang{Are_you_sure} = <<EOF;
\${h1("Sicuro?")}
<p>
Si sta per avviare il ripristino diretto sulla macchina \$In{hostDest}.
I file seguenti saranno ripristinati sulla condivisione \$In{shareDest}
dal backup numero \$num:
<p>
<table border>
<tr><td>File/directory originale</td><td>Ripristinato su</td></tr>
\$fileListStr
</table>

<form action="\$MyURL" method="post">
<input type="hidden" name="host" value="\${EscHTML(\$host)}">
<input type="hidden" name="hostDest" value="\${EscHTML(\$In{hostDest})}">
<input type="hidden" name="shareDest" value="\${EscHTML(\$In{shareDest})}">
<input type="hidden" name="pathHdr" value="\${EscHTML(\$In{pathHdr})}">
<input type="hidden" name="num" value="\$num">
<input type="hidden" name="type" value="4">
\$hiddenStr
Avviare veramente?
<input type="submit" value="\$In{action}" name="action">
<input type="submit" value="No" name="">
</form>
EOF


# --------------------------
$Lang{Restore_Requested_on__hostDest} = "BackupPC: ripristino richiesto per \$hostDest";
$Lang{Reply_from_server_was___reply} = <<EOF;
\${h1(\$str)}
<p>
La risposta del server &grave; stata: \$reply
<p>
Ritorna alla <a href="\$MyURL?host=\$host">homepage di \$hostDest</a>.
EOF

$Lang{BackupPC_Archive_Reply_from_server} = <<EOF;
\${h1(\$str)}
<p>
La risposta del server &egrave; stata: \$reply
EOF

  
# -------------------------
$Lang{Host__host_Backup_Summary} = "BackupPC: prospetto backup host \$host";

$Lang{Host__host_Backup_Summary2} = <<EOF;
\${h1("Prospetto backup host \$host")}
<p>
\$warnStr
<ul>
\$statusStr
</ul>
\${h2("Azioni utente")}
<p>
<form action="\$MyURL" method="get">
<input type="hidden" name="host" value="\$host">
\$startIncrStr
<input type="submit" value="$Lang{Start_Full_Backup}" name="action">
<input type="submit" value="$Lang{Stop_Dequeue_Backup}" name="action">
</form>
\${h2("Prospetto backup")}
<p>
Cliccare sul numero di bakcup per sfogliare e ripristinare i file di backup.
</p>
<table class="tableStnd" border cellspacing="1" cellpadding="3">
<tr class="tableheader"><td align="center"> Numero<br>backup </td>
    <td align="center"> Tipo </td>
    <td align="center"> Completo </td>
    <td align="center"> Data avvio </td>
    <td align="center"> Durata<br>(minuti) </td>
    <td align="center"> Et&agrave;<br>(giorni) </td>
    <td align="center"> Percorso backup server </td>
</tr>
\$str
</table>
<p>

\$restoreStr
</p>
<br><br>
\${h2("Prospetto errori trasferimento")}
<br><br>
<table class="tableStnd" border cellspacing="1" cellpadding="3" width="80%">
<tr class="tableheader"><td align="center"> Numero<br>backup </td>
    <td align="center"> Tipo </td>
    <td align="center"> Vedere </td>
    <td align="center"> Numero errori<br>trasferimento </td>
    <td align="center"> Numero file<br>con problemi </td>
    <td align="center"> Numero condivisioni<br>con problemi </td>
    <td align="center"> Numero<br>errori tar </td>
</tr>
\$errStr
</table>
<br><br>

\${h2("Prospetto dimensioni file/contatore riutilizzo")}
<p>
I file esistenti sono quelli gi&agrave; presenti nel pool; i file nuovi sono
quelli aggiunti al pool.
I file vuoti e gli errori SMB non sono conteggiati nei contatori di
riutilizzo e file nuovi.
<table class="tableStnd" border cellspacing="1" cellpadding="3" width="80%">
<tr class="tableheader"><td colspan="2" bgcolor="#ffffff"></td>
    <td align="center" colspan="3"> Totali </td>
    <td align="center" colspan="2"> File esistenti </td>
    <td align="center" colspan="2"> File nuovi </td>
</tr>
<tr class="tableheader">
    <td align="center"> Numero<br>backup </td>
    <td align="center"> Tipo </td>
    <td align="center"> Numero<br>file </td>
    <td align="center"> Dimensione<br>(MB) </td>
    <td align="center"> Velocit&agrave<br>(MB/s) </td>
    <td align="center"> Numero<br>file </td>
    <td align="center"> Dimensione<br>(MB) </td>
    <td align="center"> Numero<br>file </td>
    <td align="center"> Dimensione<br>(MB) </td>
</tr>
\$sizeStr
</table>
<br><br>

\${h2("Prospetto compressione")}
<p>
Prestazione della compressione per file gi&agrave; nel pool e per quelli
nuovi.
</p>
<table class="tableStnd" border cellspacing="1" cellpadding="3" width="80%">
<tr class="tableheader"><td colspan="3" bgcolor="#ffffff"></td>
    <td align="center" colspan="3"> File esistenti </td>
    <td align="center" colspan="3"> File nuovi </td>
</tr>
<tr class="tableheader"><td align="center"> Numero<br>backup </td>
    <td align="center"> Tipo </td>
    <td align="center"> Livello<br>compressione </td>
    <td align="center"> Dimensione<br>(MB) </td>
    <td align="center"> Compresso<br>(MB) </td>
    <td align="center"> Tasso<br>compressione </td>
    <td align="center"> Dimensione<br>(MB) </td>
    <td align="center"> Compresso<br>(MB) </td>
    <td align="center"> Tasso<br>compressione </td>
</tr>
\$compStr
</table>
<br><br>
EOF

$Lang{Host__host_Archive_Summary} = "BackupPC: prospetto archivi host \$host";
$Lang{Host__host_Archive_Summary2} = <<EOF;
\${h1("Prospetto archivi host \$host")}
<p>
\$warnStr
<ul>
\$statusStr
</ul>

\${h2("Azioni utente")}
<p>
<form action="\$MyURL" method="get">
<input type="hidden" name="archivehost" value="\$host">
<input type="hidden" name="host" value="\$host">
<input type="submit" value="$Lang{Start_Archive}" name="action">
<input type="submit" value="$Lang{Stop_Dequeue_Archive}" name="action">
</form>

\$ArchiveStr

EOF

# -------------------------
$Lang{Error} = "BackupPC: Errore";
$Lang{Error____head} = <<EOF;
\${h1("Error: \$head")}
<p>\$mesg</p>
EOF

# -------------------------
$Lang{NavSectionTitle_} = "Server";

# -------------------------
$Lang{Backup_browse_for__host} = <<EOF;
\${h1("Sfoglia backup per \$host")}

<script language="javascript" type="text/javascript">
<!--

    function checkAll(location)
    {
      for (var i=0;i<document.form1.elements.length;i++)
      {
        var e = document.form1.elements[i];
        if ((e.checked || !e.checked) && e.name != \'all\') {
            if (eval("document.form1."+location+".checked")) {
            	e.checked = true;
            } else {
            	e.checked = false;
            }
        }
      }
    }
    
    function toggleThis(checkbox)
    {
       var cb = eval("document.form1."+checkbox);
       cb.checked = !cb.checked;	
    }

//-->
</script>

<form name="form0" method="post" action="\$MyURL">
<input type="hidden" name="num" value="\$num">
<input type="hidden" name="host" value="\$host">
<input type="hidden" name="share" value="\${EscHTML(\$share)}">
<input type="hidden" name="action" value="browse">
<ul>
<li>Si sta sfogliando il backup numero \$num effettuato il \$backupTime
    (\$backupAge giorni fa),
\$filledBackup
<li>Entra directory: <input type="text" name="dir" size="50" maxlength="4096" value="\${EscHTML(\$dir)}"> <input type="submit" value="\$Lang->{Go}" name="Immetti">
<li>Fare clic su una directory per aprirla
<li>Fare clic su un file per ripristinarlo
<li>&Egrave; possibile visualizzare la <a href="\$MyURL?action=dirHistory&host=\${EscURI(\$host)}&share=\$shareURI&dir=\$pathURI">cronologia</a> dei backup della directory corrente
</ul>
</form>

\${h2("Contents of \${EscHTML(\$dirDisplay)}")}
<form name="form1" method="post" action="\$MyURL">
<input type="hidden" name="num" value="\$num">
<input type="hidden" name="host" value="\$host">
<input type="hidden" name="share" value="\${EscHTML(\$share)}">
<input type="hidden" name="fcbMax" value="\$checkBoxCnt">
<input type="hidden" name="action" value="$Lang{Restore}">
<br>
<table width="100%">
<tr><td valign="top">
    <!--Navigate here:-->
    <br><table align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
    \$dirStr
    </table>
</td><td width="3%">
</td><td valign="top">
    <br>
        <table border="0" width="100%" align="left" cellpadding="3" cellspacing
  ="1">
        <table border="0" width="100%" align="left" cellpadding="2" cellspacing="1">
        \$fileHeader
        \$topCheckAll
        \$fileStr
        \$checkAll
        </table>
    </td></tr></table>
<br>
<!--
This is now in the checkAll row
<input type="submit" name="Submit" value="Ripristina file selezionati">
-->
</td></tr></table>
</form>
EOF

# ------------------------------
$Lang{DirHistory_backup_for__host} = "BackupPC: Cronologia backup directory per \$host";

#
# These two strings are used to build the links for directories and
# file versions.  Files are appended with a version number.
#
$Lang{DirHistory_dirLink}  = "dir";
$Lang{DirHistory_fileLink} = "v";

$Lang{DirHistory_for__host} = <<EOF;
\${h1("Cronologia backup directory per \$host")}
<p>
Questa videata mostra tutte le versioni uniche disponibili nei diversi backup:
<ul>
<li> Fare clic su un numero di backup per ritornare al navigatore di backup
<li> Fare clic sul collegamento ad una directory
     (\$Lang->{DirHistory_dirLink}) per navigare nella directory stessa
<li> Fare clic sul collegamento ad un file (\$Lang->{DirHistory_fileLink}0,
     \$Lang->{DirHistory_fileLink}1, ...) per scaricare quel file
<li> I file con lo stesso contenuto fra backup diversi hanno lo stesso
     numero di versione
<li> I file o directory non disponibili in uno specifico backup presentano
     una casella vuota
<li> I file visualizzati con la stessa versione possono avere attributi
     diversi.  Selezionare il numero di backup per visualizzare gli
     attributi del file.
</ul>

\${h2("Cronologia di \${EscHTML(\$dirDisplay)}")}

<br>
<table cellspacing="2" cellpadding="3">
<tr class="fviewheader"><td>Numero backup</td>\$backupNumStr</tr>
<tr class="fviewheader"><td>Data backup</td>\$backupTimeStr</tr>
\$fileStr
</table>
EOF

# ------------------------------
$Lang{Restore___num_details_for__host} = "BackupPC: dettagli ripristino numero \$num per \$host";

$Lang{Restore___num_details_for__host2 } = <<EOF;
\${h1("Dettagli ripristino numero \$num per \$host")}
<p>
<table class="tableStnd" border cellspacing="1" cellpadding="3" width="50%">
<tr><td class="tableheader"> Numero </td><td> \$Restores[\$i]{num} </td></tr>
<tr><td class="tableheader"> Richiesto da </td><td> \$RestoreReq{user} </td></tr>
<tr><td class="tableheader"> Data richiesta </td><td> \$reqTime </td></tr>
<tr><td class="tableheader"> Risultato </td><td> \$Restores[\$i]{result} </td></tr>
<tr><td class="tableheader"> Messaggio d\'errore </td><td> \$Restores[\$i]{errorMsg} </td></tr>
<tr><td class="tableheader"> Host sorgente </td><td> \$RestoreReq{hostSrc} </td></tr>
<tr><td class="tableheader"> Numero backup<br>sorgente </td><td> \$RestoreReq{num} </td></tr>
<tr><td class="tableheader"> Condivisione<br>sorgente </td><td> \$RestoreReq{shareSrc} </td></tr>
<tr><td class="tableheader"> Host destinazione </td><td> \$RestoreReq{hostDest} </td></tr>
<tr><td class="tableheader"> Condivisione<br>destinazione </td><td> \$RestoreReq{shareDest} </td></tr>
<tr><td class="tableheader"> Data avvio </td><td> \$startTime </td></tr>
<tr><td class="tableheader"> Durata </td><td> \$duration min </td></tr>
<tr><td class="tableheader"> Numero file </td><td> \$Restores[\$i]{nFiles} </td></tr>
<tr><td class="tableheader"> Dimensione totale </td><td> \${MB}MB </td></tr>
<tr><td class="tableheader"> Tasso<br>trasferimento </td><td> \$MBperSecMB/s </td></tr>
<tr><td class="tableheader"> Errori<br>creazione tar </td><td> \$Restores[\$i]{tarCreateErrs} </td></tr>
<tr><td class="tableheader"> Errori<br>trasferimento </td><td> \$Restores[\$i]{xferErrs} </td></tr>
<tr><td class="tableheader"> File log<br>trasferimento </td><td>
<a href="\$MyURL?action=view&type=RestoreLOG&num=\$Restores[\$i]{num}&host=\$host">Vedi</a>,
<a href="\$MyURL?action=view&type=RestoreErr&num=\$Restores[\$i]{num}&host=\$host">Errori</a>
</tr></tr>
</table>
</p>
\${h1("Elenco file/directory")}
<p>
<table class="tableStnd" border cellspacing="1" cellpadding="3" width="100%">
<tr class="tableheader"><td>File/directory originali</td><td>Ripristinato su</td></tr>
\$fileListStr
</table>
EOF

# ------------------------------
$Lang{Archive___num_details_for__host} = "BackupPC: Dettagli archivio n. \$num per \$host";

$Lang{Archive___num_details_for__host2 } = <<EOF;
\${h1("Dettagli archivio n. \$num per \$host")}
<p>
<table class="tableStnd" border cellspacing="1" cellpadding="3" width="50%">
<tr><td class="tableheader"> Number </td><td class="border"> \$Archives[\$i]{num} </td></tr>
<tr><td class="tableheader"> Requested by </td><td class="border"> \$ArchiveReq{user} </td></tr>
<tr><td class="tableheader"> Request time </td><td class="border"> \$reqTime </td></tr>
<tr><td class="tableheader"> Result </td><td class="border"> \$Archives[\$i]{result} </td></tr>
<tr><td class="tableheader"> Error Message </td><td class="border"> \$Archives[\$i]{errorMsg} </td></tr>
<tr><td class="tableheader"> Start time </td><td class="border"> \$startTime </td></tr>
<tr><td class="tableheader"> Duration </td><td class="border"> \$duration\' </td></tr>
<tr><td class="tableheader"> Xfer log file </td><td class="border">
<a href="\$MyURL?action=view&type=ArchiveLOG&num=\$Archives[\$i]{num}&host=\$host">Visualizza</a>,
<a href="\$MyURL?action=view&type=ArchiveErr&num=\$Archives[\$i]{num}&host=\$host">Errori</a>
</tr></tr>
</table>
<p>
\${h1("Elenco host")}
<p>
<table class="tableStnd" border cellspacing="1" cellpadding="3" width="80%">
<tr class="tableheader"><td>Host</td><td>Numero backup</td></tr>
\$HostListStr
</table>
EOF

# -----------------------------------
$Lang{Email_Summary} = "BackupPC: Prospetto email";

# -----------------------------------
#  !! ERROR messages !!
# -----------------------------------
$Lang{BackupPC__Lib__new_failed__check_apache_error_log} = "BackupPC::Lib->new fallita: controllare il file error_log di Apache\n";
$Lang{Wrong_user__my_userid_is___} =  
              "Utente errato: il mio ID utente &egrave; \$> invece di \$uid"
            . "(\$Conf{BackupPCUser})\n";
# $Lang{Only_privileged_users_can_view_PC_summaries} = "Solo gli utenti privilegiati possono visualizzare i prospetti dei PC.";
$Lang{Only_privileged_users_can_stop_or_start_backups} = 
                  "Solo gli utenti privilegiati possono arrestare o avviare un backup su"
		. " \${EscHTML(\$host)}.";
$Lang{Invalid_number__num} = "Numero non valido: \$num";
$Lang{Unable_to_open__file__configuration_problem} = "Impossibile aprire il file \$file: problema di configurazione?";
$Lang{Only_privileged_users_can_view_log_or_config_files} = "Solo gli utenti privilegiati possono visualizzare i file di log o di configurazione.";
$Lang{Only_privileged_users_can_view_log_files} = "Solo gli utenti privilegiati possono visualizzare i file di log.";
$Lang{Only_privileged_users_can_view_email_summaries} = "Solo gli utenti privilegiati possono visualizzare il prospetto delle email.";
$Lang{Only_privileged_users_can_browse_backup_files} = "Solo gli utenti privilegiati possono sfogliare i file di backup"
                . " per l\'host \${EscHTML(\$In{host})}.";
$Lang{Empty_host_name} = "Nome host vuoto.";
$Lang{Directory___EscHTML} = "La directory \${EscHTML(\"\$TopDir/pc/\$host/\$num\")}"
		    . " &egrave; vuota";
$Lang{Can_t_browse_bad_directory_name2} = "Impossibile sfogliare la director. Nome non valido:"
	            . " \${EscHTML(\$relDir)}";
$Lang{Only_privileged_users_can_restore_backup_files} = "Solo gli utenti privilegiati possono ripristinare dei file di backup"
                . " per l\'host \${EscHTML(\$In{host})}.";
$Lang{Bad_host_name} = "Nome host non valido \${EscHTML(\$host)}";
$Lang{You_haven_t_selected_any_files__please_go_Back_to} = "Non &egrave; stato selezionato alcun file.  Andare indietro per"
                . " per selezionare un file.";
$Lang{You_haven_t_selected_any_hosts} = "Non &egrave; stato selezionato alcun host. Andare indietro"
                . " per selezionarne uno.";
$Lang{Nice_try__but_you_can_t_put} = "Bella mossa, man non &egrave; possibile mettere \'..\' in nessun nome di file";
$Lang{Host__doesn_t_exist} = "L\'host \${EscHTML(\$In{hostDest})} non esiste";
$Lang{You_don_t_have_permission_to_restore_onto_host} = "Non si possiedono i permessi per ripristinare sull\'host"
		    . " \${EscHTML(\$In{hostDest})}";
$Lang{Can_t_open_create} = "Impossibile creare/aprire "
                    . "\${EscHTML(\"\$TopDir/pc/\$hostDest/\$reqFileName\")}";
$Lang{Only_privileged_users_can_restore_backup_files2} = "Solo gli utenti privilegiati possono ripristinare i file"
                . " per l\'host \${EscHTML(\$host)}.";
$Lang{Empty_host_name} = "Nome host vuoto";
$Lang{Unknown_host_or_user} = "Host o utente sconosciuti \${EscHTML(\$host)}";
$Lang{Only_privileged_users_can_view_information_about} = "Solo gli utenti privilegiati possono visualizzare le informazioni"
                . " sull\'host \${EscHTML(\$host)}." ;
$Lang{Only_privileged_users_can_view_archive_information} = "Solo gli utenti privilegiati possono visualizzare le informazioni sugli archivi.";
$Lang{Only_privileged_users_can_view_restore_information} = "Solo gli utenti privilegiati possono visualizzare le informazioni di ripristino.";
$Lang{Restore_number__num_for_host__does_not_exist} = "Il numero di ripristino \$num per l\'host \${EscHTML(\$host)}"
	        . " non esiste.";
$Lang{Archive_number__num_for_host__does_not_exist} = "L'archivio numero \$num per l'host \${EscHTML(\$host)}"
                . " non esiste.";
$Lang{Can_t_find_IP_address_for} = "Impossibile trovare l\'indirizzo IP per \${EscHTML(\$host)}";
$Lang{host_is_a_DHCP_host} = <<EOF;
\$host &egrave; un host DHCP di cui non conosco l\'indirizzo IP.  Ho
controllato il nome netbios \$ENV{REMOTE_ADDR}\$tryIP ed ho scoperto che
quella macchina non &egrave; l\'host \$host.
<p>
Finch&eacute; non vedo \$host ad un indirizzo DHCP preciso, sar&agrave;
possibile avviare questa richiesta solo da quello stesso client.
EOF

########################
# ok you can do it then
########################

$Lang{Backup_requested_on_DHCP__host} = "Richiesta di backup su DHCP \$host (\$In{hostIP}) da parte di"
		                      . " \$User da \$ENV{REMOTE_ADDR}";

$Lang{Backup_requested_on__host_by__User} = "Richiesta di backup per \$host da \$User";
$Lang{Backup_stopped_dequeued_on__host_by__User} = "Backup arrestato/disaccodato per \$host da \$User";

$Lang{Restore_requested_to_host__hostDest__backup___num} = "Richiesta di ripristino per l\'host \$hostDest, backup  numero \$num,"
	     . " da parte di \$User da \$ENV{REMOTE_ADDR}";
$Lang{Archive_requested} = "Archivio richiesto da parte di \$User da \$ENV{REMOTE_ADDR}";

# -------------------------------------------------
# ------- Stuff that was forgotten ----------------
# -------------------------------------------------

$Lang{Status} = "Stato";
$Lang{PC_Summary} = "Prospetto PC";
$Lang{LOG_file} = "File log";
$Lang{LOG_files} = "File log";
$Lang{Old_LOGs} = "Vecchi log";
$Lang{Email_summary} = "Prospetto email";
$Lang{Config_file} = "File configurazione";
$Lang{Hosts_file} = "File host";
$Lang{Current_queues} = "Code correnti";
$Lang{Documentation} = "Documentazione";

#$Lang{Host_or_User_name} = "<small>Host o nome utente:</small>";
$Lang{Go} = "Vai";
$Lang{Hosts} = "Host";

$Lang{There_have_been_no_archives} = "<h2> Non ci sono state archiviazioni </h2>\n";
$Lang{This_PC_has_never_been_backed_up} = "<h2> Non &egrave; mai stato eseguito un backup per questo PC!!! </h2>\n";
$Lang{This_PC_is_used_by} = "<li>Questo PC &egrave; usato da \${UserLink(\$user)}";

$Lang{Extracting_only_Errors} = "(Estrazione dei soli errori)";
$Lang{XferLOG} = "TransLOG";
$Lang{Errors}  = "Errori";

# ------------
$Lang{Last_email_sent_to__was_at___subject} = <<EOF;
<li>L\'ultima email inviata a \${UserLink(\$user)} &egrave; stata spedita il \$mailTime con oggetto "\$subj".
EOF
# ------------
$Lang{The_command_cmd_is_currently_running_for_started} = <<EOF;
<li>Il comando \$cmd, avviato il \$startTime, &egrave; attualmente in esecuzione per \$host.
EOF

# -----------
$Lang{Host_host_is_queued_on_the_background_queue_will_be_backed_up_soon} = <<EOF;
<li>L\'host \$host &egrave; accodato nella coda di background (il backup comincer&agrave; a breve).
EOF

# ----------
$Lang{Host_host_is_queued_on_the_user_queue__will_be_backed_up_soon} = <<EOF;
<li>L\'host \$host &egrave; accodato nella coda utente (il backup comincer&agrave; a breve).
EOF

# ---------
$Lang{A_command_for_host_is_on_the_command_queue_will_run_soon} = <<EOF;
<li>&Egrave gi&agrave; presente un comando per \$host nella coda dei comandi (sar&agrave; eseguito a breve).
EOF

# --------
$Lang{Last_status_is_state_StatusHost_state_reason_as_of_startTime} = <<EOF;
<li>L\'ultimo stato &egrave; \"\$Lang->{\$StatusHost{state}}\"\$reason del \$startTime.
EOF

# --------
$Lang{Last_error_is____EscHTML_StatusHost_error} = <<EOF;
<li>L\'ultimo errore &egrave; \"\${EscHTML(\$StatusHost{error})}\".
EOF

# ------
$Lang{Pings_to_host_have_failed_StatusHost_deadCnt__consecutive_times} = <<EOF;
<li>I ping verso \$host sono falliti per \$StatusHost{deadCnt} volte consecutive.
EOF

# -----
$Lang{Prior_to_that__pings} = "Prima di questo, i ping";

# -----
$Lang{priorStr_to_host_have_succeeded_StatusHostaliveCnt_consecutive_times} = <<EOF;
<li>\$priorStr verso \$host hanno avuto successo per \$StatusHost{aliveCnt}
        volte consecutive.
EOF

$Lang{Because__host_has_been_on_the_network_at_least__Conf_BlackoutGoodCnt_consecutive_times___} = <<EOF;
<li>Poich&eacute; \$host &egrave; rimasto in rete per almeno \$Conf{BlackoutGoodCnt}
volte consecutive, il backup non sar&agrave; effettuato dalle \$t0 alle \$t1 di \$days.
EOF

$Lang{Backups_are_deferred_for_hours_hours_change_this_number} = <<EOF;
<li>I backup sono stati posticipati per \$hours ore
(<a href=\"\$MyURL?action=\${EscURI(\$Lang->{Stop_Dequeue_Archive})}&host=\$host\">modifica questo numero</a>).
EOF

$Lang{tryIP} = " e \$StatusHost{dhcpHostIP}";

#$Lang{Host_Inhost} = "Host \$In{host}";

$Lang{checkAll} = <<EOF;
<tr><td class="fviewborder">
<input type="checkbox" name="allFiles" onClick="return checkAll('allFiles');">&nbsp;Seleziona tutto
</td><td colspan="5" align="center" class="fviewborder">
<input type="submit" name="Submit" value="Ripristina file selezionati">
</td></tr>
EOF

$Lang{checkAllHosts} = <<EOF;
<tr><td class="fviewborder">
<input type="checkbox" name="allFiles" onClick="return checkAll('allFiles');">&nbsp;Seleziona tutto
</td><td colspan="2" align="center" class="fviewborder">
<input type="submit" name="Submit" value="Archivia host selezionati">
</td></tr>
EOF
 
$Lang{fileHeader} = <<EOF;
    <tr class="fviewheader"><td align=center> Nome </td>
       <td align="center"> Tipo </td>
       <td align="center"> Modo </td>
       <td align="center"> Numero </td>
       <td align="center"> Dimensione </td>
       <td align="center"> Data modifica </td>
    </tr>
EOF

$Lang{Home} = "Casa";
$Lang{Browse} = "Naviga backup";
$Lang{Last_bad_XferLOG} = "Ultimo TransLOG fallito";
$Lang{Last_bad_XferLOG_errors_only} = "Ultimo TransLOG fallito (solo&nbsp;errori)";

$Lang{This_display_is_merged_with_backup} = <<EOF;
<li> Questa visualizzazione &egrave; fusa con il backup numero \$numF.
EOF

$Lang{Visit_this_directory_in_backup} = <<EOF;
<li> Selezionare il backup che si desidera visualizzare: <select onChange="window.location=this.value">\$otherDirs </select>
EOF

$Lang{Restore_Summary} = <<EOF;
\${h2("Prospetto ripristino")}
<p>
Fare clic sul numero del ripristino per maggiori dettagli.
<table class="tableStnd" border cellspacing="1" cellpadding="3" width="80%">
<tr class="tableheader"><td align="center"> Numero<br>ripristino </td>
    <td align="center"> Risultato </td>
    <td align="right"> Data avvio</td>
    <td align="right"> Durata<br>(minuti)</td>
    <td align="right"> Numero<br>file </td>
    <td align="right"> Dimensione<br>(MB) </td>
    <td align="right"> Numero<br>errori tar </td>
    <td align="right"> Numero errori<br>trasferimento </td>
</tr>
\$restoreStr
</table>
<p>
EOF

$Lang{Archive_Summary} = <<EOF;
\${h2("Prospetto archivi")}
<p>
Fare clic sul numero di archivio per maggiori dettagli.
<table class="tableStnd" border cellspacing="1" cellpadding="3" width="80%">
<tr class="tableheader"><td align="center"> Numero<br>archivio</td>
    <td align="center"> Risultato </td>
    <td align="right"> Data<br>avvio</td>
    <td align="right"> Durata<br>minuti</td>
</tr>
\$ArchiveStr
</table>
<p>
EOF

$Lang{BackupPC__Documentation} = "BackupPC: Documentazione";

$Lang{No} = "no";
$Lang{Yes} = "s&igrave;";

$Lang{The_directory_is_empty} = <<EOF;
<tr><td bgcolor="#ffffff">La directory \${EscHTML(\$dirDisplay)} &egrave; vuota
</td></tr>
EOF

#$Lang{on} = "acceso";
$Lang{off} = "spento";

$Lang{backupType_full} = "comp.";
$Lang{backupType_incr} = "incr.";
$Lang{backupType_partial} = "parziale";

$Lang{failed} = "fallito";
$Lang{success} = "eseguito";
$Lang{and} = "e";

# ------
# Hosts states and reasons
$Lang{Status_idle} = "inattivo";
$Lang{Status_backup_starting} = "avvio backup";
$Lang{Status_backup_in_progress} = "backup in esecuzione";
$Lang{Status_restore_starting} = "avvio ripristino";
$Lang{Status_restore_in_progress} = "restore in esecuzione";
$Lang{Status_link_pending} = "collegamenti pendenti";
$Lang{Status_link_running} = "collegamenti in esecuzione";

$Lang{Reason_backup_done}    = "backup eseguito";
$Lang{Reason_restore_done}   = "restore eseguito";
$Lang{Reason_nothing_to_do}  = "nulla da fare";
$Lang{Reason_backup_failed}  = "backup fallito";
$Lang{Reason_restore_failed} = "restore fallito";
$Lang{Reason_archive_failed} = "archivio fallito";
$Lang{Reason_no_ping}        = "no ping";
$Lang{Reason_backup_canceled_by_user}  = "backup annullato dall\'utente";
$Lang{Reason_restore_canceled_by_user} = "ripristino annullato dall\'utente";
$Lang{Reason_archive_canceled_by_user} = "archivio annullato dall\'utente";

# ---------
# Email messages

# No backup ever
$Lang{EMailNoBackupEverSubj} = "BackupPC: nessun backup riuscito per \$host";
$Lang{EMailNoBackupEverMesg} = <<'EOF';
To: $user$domain
Subject: $subj

Ciao $userName,

Il nostro software di backup non e` ancora riuscito ad effettuare un
backup del tuo PC ($host).  I backup dei PC dovrebbero essere eseguiti
automaticamente quando il tuo PC e` connesso alla rete.  E` necessario
richiedere il supporto tecnico nel caso in cui:

  - il tuo PC sia stato connesso regolarmente alla rete, nel qual caso
    potrebbe sussistere un problema di configurazione o impostazione
    che impedisce l'esecuzione del backup;

  - non si desideri che sia eseguito il backup del proprio PC e che
    questo messaggio non sia piu` inviato.

In caso contrario, assicurati che il tuo PC sia connesso alla rete la
prossima volta che sei in ufficio.

Ciao.

BackupPC Genie
http://backuppc.sourceforge.net/
EOF

# No recent backup
$Lang{EMailNoBackupRecentSubj} = "BackupPC: non ci sono backup recenti per \$host";
$Lang{EMailNoBackupRecentMesg} = <<'EOF';
To: $user$domain
Subject: $subj

Ciao $userName,

e` stato effettuato correttamente il backup del tuo PC ($host) per
$days giorni.  Dal $firstTime fino a $days fa sono stati eseguiti con
successo $numBackups backup.  I backup dei PC dovrebbero avvenire
automaticamente quando il tuo PC e` connesso alla rete.

Se il tuo PC e` rimasto connesso alla rete solo per qualche ora durante
gli ultimi $days giorni, dovresti contattare l'amministratore di sistema
per capire perche' i backup non sono stati effettuati.

In caso contrario, se sei fuori ufficio, non c'e` molto che tu possa
fare, se non copiare manualmente i file particolarmente critici su un
altro dispositivo. Tieni presente che qualsiasi file creato o modificato
negli ultimi $days giorni (compresi i nuovi messaggi di posta elettronica
e gli allegati) non possono essere ripristinato se il tuo PC si guasta.

Ciao.

BackupPC Genie
http://backuppc.sourceforge.net
EOF

# Old Outlook files
$Lang{EMailOutlookBackupSubj} = "BackupPC: i file di Outlook su \$host richiedono un backup";
$Lang{EMailOutlookBackupMesg} = <<'EOF';
To: $user$domain
Subject: $subj

Ciao $userName,

Il backup dei file di Outlook presenti sul tuo PC $howLong.

Questi file contengono tutti i tuoi messaggi di posta elettronica, gli
allegati, i contatti e gli appuntamenti. Il backup del tuo PC e` stato
effettuato correttamente $numBackups volte, a partire dal $firstTime fino
a $lastTime giorni fa. Outlook, pero`, blocca tutti i suoi file quando
e` in esecuzione, impedendo di fatto il backup dei suoi file.

Ti consiglio di effettuare il backup dei file di Outlook quando sei
collegato alla rete. E` sufficiente uscire da Outlook e da tutte le altre
applicazioni e, semplicemente usando il tuo programma di navigazione,
andare alla seguente pagina:

    $CgiURL?host=$host               

Seleziona "Avvia backup incrementale" due volte per avviare un nuovo
backup incrementale. E` possibile selezionare "Ritorna alla pagina di
$host" e quindi cliccare su "ricarica" per controllare lo stato del backup.
Il backup dovrebbe essere pronto entro pochi minuti.

Ciao.

BackupPC Genie
http://backuppc.sourceforge.net
EOF

$Lang{howLong_not_been_backed_up} = "non e` riuscito";
$Lang{howLong_not_been_backed_up_for_days_days} = "risale a \$days giorni fa";