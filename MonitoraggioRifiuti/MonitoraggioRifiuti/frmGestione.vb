Imports System.Threading
Public Class frmGestione

    'Questa è la dichiarazione del Thread separato da quello principale
    Private newThread As Thread
    'Questa è la dichiarazione del Form SplashScreen
    Private Splash As SplashScreen
    'Questa è una variabile booleana che mi permette di chiudere lo SplashScreen al termine di tutte le operazioni
    Private Fine As Boolean

    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load

        'Creo una nuova istanza del Thread
        newThread = New Thread(AddressOf InitializeForm)
        'Faccio partire il Thread separato
        newThread.Start()
        'Scrivo nella label
        'Label1.Text = "Questo l'ho inizializzato durante la visualizzazione dello splash screen"
        'Attendo 3 secondi senza fare nulla giusdto per perder tempo

        'Main.Timer1.Enabled = False
        'Me.Codici_CERTableAdapter.FillCodiciCer(Me.SicuraDataSet1.Codici_CER)
        'Me.EXTRATESTERIFIUTITableAdapter.FillExtraTesteRifiuti(Me.SicuraDataSet.EXTRATESTERIFIUTI)
        Me.Biri_MonitoraggioRifiutiTableAdapter.FillMonitoraggio(Me.SicuraDataSet.Biri_MonitoraggioRifiuti)
        'Splash.Close()


        Thread.Sleep(10000)
        'Scrivo nel TextBox
        'TextBox1.Text = "e qui ho valorizzato la proprietà Text"
        'Attendo 3 secondi senza fare nulla giusdto per perder tempo
        Thread.Sleep(3000)
        'Imposto a True la variabile booleana per chiudere lo splashscreen
        Fine = True



    End Sub

    Private Sub InitializeForm()
        ' Qui ho giocato un pò con delle variabili integer per permettere una stupidissima animazione della Label
        'senza bloccare l'esecuzione del Thread in modo da lasciare scorrere l'animazione della progress bar.
        Dim a As Integer
        Dim b As Integer
        Splash = New SplashScreen
        Splash.Show()
        Splash.Label1.Text = "Caricamento in corso"
        Do
            If a > 10000 Then
                Splash.Label1.Text += "."
                a = 0
                b += 1
            End If
            a += 1
            If b > 10 Then
                Splash.Label1.Text = "Caricamento in corso"
                b = 0
            End If
            'Questo permette l'aggiornamento della parte grafica dello splashscreen
            Application.DoEvents()
        Loop Until Fine
        Splash.Close()
    End Sub


    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim FrmDett As New DettaglioDoc

        FrmDett.stringfilter = Biri_MonitoraggioRifiutiDataGridView.CurrentRow.Cells(0).Value.ToString()
        FrmDett.Show()


    End Sub

    Private Sub ToolStripButton1_Click(sender As Object, e As EventArgs) Handles SalvaRegistrazione.Click
        Validate()
        EXTRATESTERIFIUTIBindingSource.EndEdit()
        EXTRATESTERIFIUTITableAdapter.Update(SicuraDataSet)
    End Sub




    Private Sub ToolStripButton1_Click_1(sender As Object, e As EventArgs) Handles ApplicaFiltro.Click
        Dim strSearc As String

        strSearc = Me.TextBoxFiltro.Text
        Me.Biri_MonitoraggioRifiutiBindingSource.Filter = "DSCCONTO1 Like '%" & strSearc & "%'"
    End Sub

    Private Sub ToolStripButton1_Click_2(sender As Object, e As EventArgs) Handles RimuoviFiltro.Click
        Me.Biri_MonitoraggioRifiutiBindingSource.Filter = ""
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim sPath As String = "C:\Temp\"
        Dim Protocollo As String = Biri_MonitoraggioRifiutiDataGridView.CurrentRow.Cells(0).Value.ToString() & " - " & Biri_MonitoraggioRifiutiDataGridView.CurrentRow.Cells(7).Value.ToString()
        'Visualizza il messaggio e ne confronta il risultato con No. Se si è premuto No
        'la condizione viene soddisfatta ed eseguito il codice all'interno
        If MessageBox.Show("Creo e visualizzo la cartella per gli allegati?", "ALLEGATI", MessageBoxButtons.YesNo) = DialogResult.Yes Then

            sPath = sPath + Protocollo
            If (My.Computer.FileSystem.DirectoryExists(sPath) = False) Then
                My.Computer.FileSystem.CreateDirectory(sPath)
                EXTRATESTERIFIUTIDataGridView.CurrentRow.Cells(8).Value = sPath
                Validate()
                EXTRATESTERIFIUTIBindingSource.EndEdit()
                EXTRATESTERIFIUTITableAdapter.Update(SicuraDataSet)
                'TextBox1.Text = sPath
            Else
                'For Each foundFile As String In My.Computer.FileSystem.GetFiles(sPath)
                '    ListBox1.Items.Add(foundFile)
                'Next 'Something else happens, because the folder exists
                Process.Start("explorer.exe", String.Format("/n, /e, {0}", sPath))

            End If
        Else
            ''Usa MessageBox.Show invece di MsgBox
            ''Saluto
            MessageBox.Show("Azione Annullata", "Non entro", MessageBoxButtons.OK, MessageBoxIcon.Asterisk) 'Idem
            ''Esce dall'applicazione
            'Application.Exit() 'Evita di usare End
        End If



    End Sub





    Private Sub oDTP_ValueChanged(sender As Object, e As EventArgs) Handles oDTP.ValueChanged
        EXTRATESTERIFIUTIDataGridView.CurrentCell.Value = oDTP.Value
    End Sub

    Private Sub EXTRATESTERIFIUTIDataGridView_CellLeave(sender As Object, e As DataGridViewCellEventArgs) Handles EXTRATESTERIFIUTIDataGridView.CellLeave
        oDTP.Visible = False
    End Sub

    Private Sub EXTRATESTERIFIUTIDataGridView_DataError(sender As Object, e As DataGridViewDataErrorEventArgs) Handles EXTRATESTERIFIUTIDataGridView.DataError
        Dim Result As DialogResult

        'Riporta l'errore all'utente, e lascia scegliere se 
        'modificare i dati incompatibili oppure annullare
        'le modifiche e cancellare la riga
        Result = MessageBox.Show("Si ? verificato un errore di compatibilit? dei dati immessi. Messaggio:" &
            Environment.NewLine & e.Exception.Message & Environment.NewLine &
            "E' possibile che dei dati mancanti compromettano il database. Premere S? per modificare opportunamente " &
            "tali valori, o No per cancellare la riga.", Me.Text, MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation)

        If Result = Windows.Forms.DialogResult.Yes Then
            'Annulla questo evento: non viene generata la
            'finestra di errore
            e.Cancel = True
            'Pone il cursore sulla casella corrente e obbliga
            'ad iniziare l'edit mode. Il valore booleano tra
            'parentesi indica di selezionare l'intero contenuto
            'della cella corrente
            EXTRATESTERIFIUTIDataGridView.BeginEdit(True)
        Else
            'Annulla l'eccezione e l'evento, quindi cancella
            'la riga corrente
            e.ThrowException = False
            e.Cancel = True
            'Le righe "nuove", ossia quelle in cui non è
            'stato salvato ancora nessun dato, non possono essere
            'eliminate (così dice il datagridview...)
            If Not EXTRATESTERIFIUTIDataGridView.CurrentRow.IsNewRow Then
                EXTRATESTERIFIUTIDataGridView.Rows.Remove(EXTRATESTERIFIUTIDataGridView.CurrentRow)
            End If
        End If
    End Sub

    Private Sub EXTRATESTERIFIUTIDataGridView_CellDoubleClick(sender As Object, e As DataGridViewCellEventArgs) Handles EXTRATESTERIFIUTIDataGridView.CellDoubleClick
        Select Case e.ColumnIndex
            Case 6
                '//Adding DateTimePicker control into DataGridView   
                EXTRATESTERIFIUTIDataGridView.Controls.Add(oDTP)

                '// Setting the format (i.e. 02/07/2017 - mm/dd/yyyy)
                oDTP.Format = DateTimePickerFormat.Short

                '// It returns the retangular area that represents the Display area for a cell  
                Dim oRectangle = EXTRATESTERIFIUTIDataGridView.GetCellDisplayRectangle(e.ColumnIndex, e.RowIndex, True)

                '//Setting area for DateTimePicker Control  
                oDTP.Size = New Size(oRectangle.Width, oRectangle.Height)

                '// Setting Location
                oDTP.Location = New Point(oRectangle.X, oRectangle.Y)
                '// Read value from DataGridView into DateTimePicker
                If String.IsNullOrEmpty(Trim(CStr(EXTRATESTERIFIUTIDataGridView.CurrentCell.Value.ToString))) Then
                    oDTP.Value = Now()

                Else
                    oDTP.Value = EXTRATESTERIFIUTIDataGridView.CurrentCell.Value
                End If
                '// Now make it visible  
                oDTP.Visible = True
                '// Force to change date value at oDTP_ValueChanged Event.
                AddHandler oDTP.ValueChanged, AddressOf oDTP_ValueChanged

            Case 4
                '//Adding DateTimePicker control into DataGridView   
                EXTRATESTERIFIUTIDataGridView.Controls.Add(oDTP)

                '// Setting the format (i.e. 02/07/2017 - mm/dd/yyyy)
                oDTP.Format = DateTimePickerFormat.Short

                '// It returns the retangular area that represents the Display area for a cell  
                Dim oRectangle = EXTRATESTERIFIUTIDataGridView.GetCellDisplayRectangle(e.ColumnIndex, e.RowIndex, True)

                '//Setting area for DateTimePicker Control  
                oDTP.Size = New Size(oRectangle.Width, oRectangle.Height)

                '// Setting Location
                oDTP.Location = New Point(oRectangle.X, oRectangle.Y)
                '// Read value from DataGridView into DateTimePicker
                If String.IsNullOrEmpty(Trim(CStr(EXTRATESTERIFIUTIDataGridView.CurrentCell.Value.ToString))) Then
                    oDTP.Value = Now()

                Else
                    oDTP.Value = EXTRATESTERIFIUTIDataGridView.CurrentCell.Value
                End If
                '// Now make it visible  
                oDTP.Visible = True
                '// Force to change date value at oDTP_ValueChanged Event.
                AddHandler oDTP.ValueChanged, AddressOf oDTP_ValueChanged

                'Case 3
                '    'MsgBox(("Row : " + e.RowIndex.ToString & "  Col : ") + e.ColumnIndex.ToString)
                '    Dim colName As String = EXTRATESTERIFIUTIDataGridView.Columns(e.ColumnIndex).Name
                '    If colName = "btnDelRow" Then
                '        '// Delete current row from DataGridView1
                '        EXTRATESTERIFIUTIDataGridView.Rows.Remove(EXTRATESTERIFIUTIDataGridView.CurrentRow)
                'End If
        End Select

    End Sub

    Private Sub frmGestione_Activated(sender As Object, e As EventArgs) Handles Me.Activated
        'Fine = True
        Main.Close()
    End Sub
End Class
