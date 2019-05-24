Option Infer On
Option Strict On


Public Class Gestione
    Private Sub Gestione_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        'TODO: questa riga di codice carica i dati nella tabella 'SicuraDataSet.Codici_CER'. È possibile spostarla o rimuoverla se necessario.
        Me.Codici_CERTableAdapter.FillCodiciCer(Me.SicuraDataSet.Codici_CER)
        'TODO: questa riga di codice carica i dati nella tabella 'SicuraDataSet.EXTRATESTERIFIUTI'. È possibile spostarla o rimuoverla se necessario.
        Me.EXTRATESTERIFIUTITableAdapter.FillExtraTesteRifiuti(Me.SicuraDataSet.EXTRATESTERIFIUTI)
        'TODO: questa riga di codice carica i dati nella tabella 'SicuraDataSet.Biri_MonitoraggioRifiuti'. È possibile spostarla o rimuoverla se necessario.
        Me.Biri_MonitoraggioRifiutiTableAdapter.FillMonitoraggio(Me.SicuraDataSet.Biri_MonitoraggioRifiuti)

    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        Dim PosizoneCorrente = CInt(Biri_MonitoraggioRifiutiDataGridView.CurrentRow.Index)

        Try
            Dim Rcurr = Biri_MonitoraggioRifiutiBindingNavigator.PositionItem
            Dim id As Integer = DirectCast(DirectCast(EXTRATESTERIFIUTIBindingSource.Current, DataRowView).Item("ID_Extratesterifiuti"), Integer)
            Dim result As New DialogResult
            result = MessageBox.Show("Vuoi Salvare le informazioni per la riga selezionata?", "Salvataggio Dati",
                            MessageBoxButtons.YesNo, MessageBoxIcon.Question)
            If result = DialogResult.Yes Then


                Validate()
                EXTRATESTERIFIUTIBindingSource.EndEdit()
                EXTRATESTERIFIUTITableAdapter.Update(SicuraDataSet.EXTRATESTERIFIUTI)

                MessageBox.Show("Salvataggio Dati", "Salvataggio eseguito con Successo!", MessageBoxButtons.OK, MessageBoxIcon.Information)
                Biri_MonitoraggioRifiutiTableAdapter.FillMonitoraggio(SicuraDataSet.Biri_MonitoraggioRifiuti)
                EXTRATESTERIFIUTITableAdapter.FillExtraTesteRifiuti(SicuraDataSet.EXTRATESTERIFIUTI)
                ActiveForm.Refresh()

                Biri_MonitoraggioRifiutiDataGridView.CurrentCell = Biri_MonitoraggioRifiutiDataGridView.Item(0, PosizoneCorrente)
            End If


        Catch ex As Exception
            MessageBox.Show("Salvataggio Dati" & vbNewLine & "--> " & ex.Message.ToString, "Salvataggio Dati Fallito!!!",
                            MessageBoxButtons.OK, MessageBoxIcon.Stop)
        End Try

    End Sub

    Private Sub BindingNavigatorAddNewItem1_Click(sender As Object, e As EventArgs)

        Dim PosizoneCorrente = CInt(Biri_MonitoraggioRifiutiDataGridView.CurrentRow.Index)


        Try
            Dim result As New DialogResult
            result = MessageBox.Show("Vuoi Inserire una nuova riga?", "Inserimento Dati",
                            MessageBoxButtons.YesNo, MessageBoxIcon.Question)
            If result = DialogResult.Yes Then
                EXTRATESTERIFIUTITableAdapter.Insert(CInt(Biri_MonitoraggioRifiutiDataGridView.CurrentRow.Cells(0).Value),
                                                         Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Now, UtenteCorrente)
                Validate()
                EXTRATESTERIFIUTIBindingSource.EndEdit()
                EXTRATESTERIFIUTITableAdapter.Update(SicuraDataSet.EXTRATESTERIFIUTI)

                Biri_MonitoraggioRifiutiTableAdapter.FillMonitoraggio(SicuraDataSet.Biri_MonitoraggioRifiuti)
                EXTRATESTERIFIUTITableAdapter.FillExtraTesteRifiuti(SicuraDataSet.EXTRATESTERIFIUTI)
                Codici_CERTableAdapter.FillCodiciCer(SicuraDataSet.Codici_CER)

                Biri_MonitoraggioRifiutiDataGridView.CurrentCell = Biri_MonitoraggioRifiutiDataGridView.Item(0, PosizoneCorrente)
                EXTRATESTERIFIUTIBindingSource.Position = 0
                'BindingNavigator1.PositionItem = EXTRATESTERIFIUTIBindingSource.Item(0, 1)



            End If


        Catch ex As Exception
            MessageBox.Show("Inserimento Dati" & vbNewLine & "--> " & ex.Message.ToString, "Azione Annullata!!!",
                            MessageBoxButtons.OK, MessageBoxIcon.Stop)
        End Try




    End Sub





    Private Sub Show_oDTPFormulario(target As TextBox)

        Dim rect As Rectangle = target.DisplayRectangle()
        Dim x As Integer = rect.X + target.Left
        Dim y As Integer = rect.Y + target.Top
        Dim width = rect.Width + 4
        Dim height = rect.Height

        With oDTPFormulario
            .SetBounds(x, y, width, height)
            .Visible = True
            .Focus()
        End With

    End Sub

    Private Sub Show_oDTPRitiro(target As TextBox)

        Dim rect As Rectangle = target.DisplayRectangle()
        Dim x As Integer = rect.X + target.Left
        Dim y As Integer = rect.Y + target.Top
        Dim width = rect.Width + 4
        Dim height = rect.Height

        With oDTPRitiro
            .SetBounds(x, y, width, height)
            .Visible = True
            .Focus()
        End With

    End Sub

    Private Sub DataRitiroTb_DoubleClick(sender As Object, e As EventArgs) Handles DataRitiroTb.DoubleClick
        Dim Txt As System.Windows.Forms.TextBox = DirectCast(sender, TextBox)
        oDTPRitiro.Visible = False
        Show_oDTPRitiro(Txt)
        '
    End Sub



    Private Sub oDTPRitiro_ValueChanged(sender As Object, e As EventArgs) Handles oDTPRitiro.ValueChanged
        DataRitiroTb.Text = oDTPRitiro.Value.ToString()
        oDTPRitiro.Visible = False
    End Sub

    Private Sub oDTPFormulario_ValueChanged(sender As Object, e As EventArgs) Handles oDTPFormulario.ValueChanged
        DataFormularioTB.Text = oDTPFormulario.Value.ToString()
        oDTPFormulario.Visible = False
    End Sub

    Private Sub DataFormularioTB_DoubleClick(sender As Object, e As EventArgs) Handles DataFormularioTB.DoubleClick

        Dim Txt As System.Windows.Forms.TextBox = DirectCast(sender, TextBox)
        oDTPFormulario.Visible = False
        Show_oDTPFormulario(Txt)
        '


    End Sub




    Private Sub EXTRATESTERIFIUTIBindingSource_CurrentChanged(sender As Object, e As EventArgs) Handles EXTRATESTERIFIUTIBindingSource.CurrentChanged
        If BindingNavigatorCountItem1.Text = "di 0" Then
            'If Not String.IsNullOrEmpty(BindingNavigatorCountItem1.Text) Then

            'BindingNavigatorAddNewItem1.Enabled = Not 
            BindingNavigatorAddNewItem1.Enabled = True
        Else
            BindingNavigatorAddNewItem1.Enabled = False

        End If
    End Sub

    Private Sub BindingNavigatorDeleteItem1_Click(sender As Object, e As EventArgs) Handles BindingNavigatorDeleteItem1.Click
        Try
            Dim result As New DialogResult
            result = MessageBox.Show("Vuoi Inserire una nuova riga?", "Inserimento Dati",
                            MessageBoxButtons.YesNo, MessageBoxIcon.Question)
            If result = DialogResult.Yes Then

                Dim id As Integer = DirectCast(DirectCast(EXTRATESTERIFIUTIBindingSource.Current, DataRowView).Item("id_extratesterifiuti"), Integer)
                'Me.BindingNavigator1.BindingSource.RemoveCurrent()
                'Me.EXTRATESTERIFIUTIBindingSource.RemoveCurrent()
                Me.EXTRATESTERIFIUTITableAdapter.Delete(id)
                Me.Validate()
                Me.EXTRATESTERIFIUTIBindingSource.EndEdit()
                Me.EXTRATESTERIFIUTITableAdapter.Update(SicuraDataSet.EXTRATESTERIFIUTI)


            End If


        Catch ex As Exception
            MessageBox.Show("Azione Annullata!!!", "Inserimento Dati" & vbNewLine & "--> " & ex.Message.ToString,
                            MessageBoxButtons.OK, MessageBoxIcon.Stop)
        End Try


    End Sub
End Class