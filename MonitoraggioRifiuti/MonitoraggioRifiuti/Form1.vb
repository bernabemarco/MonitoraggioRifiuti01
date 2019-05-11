Public Class Form1
    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        'TODO: questa riga di codice carica i dati nella tabella 'SicuraDataSet.Codici_CER'. È possibile spostarla o rimuoverla se necessario.
        Me.Codici_CERTableAdapter.Fill(Me.SicuraDataSet.Codici_CER)
        'TODO: questa riga di codice carica i dati nella tabella 'SicuraDataSet.EXTRATESTERIFIUTI'. È possibile spostarla o rimuoverla se necessario.
        Me.EXTRATESTERIFIUTITableAdapter.FillExtraTesteRifiuti(Me.SicuraDataSet.EXTRATESTERIFIUTI)
        'TODO: questa riga di codice carica i dati nella tabella 'SicuraDataSet.Biri_MonitoraggioRifiuti'. È possibile spostarla o rimuoverla se necessario.
        Me.Biri_MonitoraggioRifiutiTableAdapter.FillMonitoraggio(Me.SicuraDataSet.Biri_MonitoraggioRifiuti)

    End Sub

    'Private Sub Biri_MonitoraggioRifiutiBindingNavigatorSaveItem_Click(sender As Object, e As EventArgs)
    '    Me.Validate()
    '    Me.BiriMonitoraggioRifiutiEXTRATESTERIFIUTIBindingSource.EndEdit()
    '    Me.TableAdapterManager.UpdateAll(Me.SicuraDataSet)
    'End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim FrmDett As New DettaglioDoc

        FrmDett.stringfilter = Biri_MonitoraggioRifiutiDataGridView.CurrentRow.Cells(0).Value.ToString()
        FrmDett.Show()


    End Sub

    Private Sub ToolStripButton1_Click(sender As Object, e As EventArgs) Handles SalvaRegistrazione.Click
        Me.Validate()
        Me.EXTRATESTERIFIUTIBindingSource.EndEdit()
        Me.EXTRATESTERIFIUTITableAdapter.Update(Me.SicuraDataSet)
    End Sub




    Private Sub ToolStripButton1_Click_1(sender As Object, e As EventArgs) Handles ApplicaFiltro.Click
        Dim strSearc As String

        strSearc = Me.TextBoxFiltro.Text
        Me.Biri_MonitoraggioRifiutiBindingSource.Filter = "DSCCONTO1 Like '%" & strSearc & "%'"
    End Sub

    Private Sub ToolStripButton1_Click_2(sender As Object, e As EventArgs) Handles ToolStripButton1.Click
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
End Class
