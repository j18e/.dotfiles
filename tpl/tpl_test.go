package main

import (
	"errors"
	"testing"

	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
)

func TestType_Method(t *testing.T) {
	for _, tc := range []struct {
		name      string
		shouldErr bool
		inp       string
		exp       string
	}{
		{
			name:      "foo",
			shouldErr: true,
			inp:       "foo",
		},
		{
			name: "bar",
			inp:  "bar",
			exp:  "bar",
		},
	} {
		t.Run(tc.name, func(t *testing.T) {
			got := tc.inp
			err := errors.New("some err")
			if tc.shouldErr {
				assert.Error(t, err)
				return
			}
			require.NoError(t, err)
			assert.Equal(t, tc.exp, got)
		})
	}
}
